local QBCore = exports['qb-core']:GetCoreObject({ 'Functions', 'Commands', 'Player' })
local sharedStarterItems = exports['qb-core']:GetShared('StarterItems')
local hasDonePreloading = {}
local Countries = json.decode(LoadResourceFile(GetCurrentResourceName(), '/countries.json'))

-- Functions

local function trim(value)
    if type(value) ~= 'string' then return '' end
    return (value:gsub('^%s*(.-)%s*$', '%1'))
end

local function getMaxCharacters(license)
    local numOfChars = Config.DefaultNumberOfCharacters
    if Config.PlayersNumberOfCharacters and next(Config.PlayersNumberOfCharacters) then
        for i = 1, #Config.PlayersNumberOfCharacters do
            local entry = Config.PlayersNumberOfCharacters[i]
            if entry.license == license then
                numOfChars = entry.numberOfChars
                break
            end
        end
    end
    return numOfChars
end

local function countCharacters(license)
    if not license then return 0 end
    return MySQL.scalar.await('SELECT COUNT(*) FROM players WHERE license = ?', { license }) or 0
end

local function isValidNamePart(name)
    name = trim(name)
    if name == '' then return false end

    local len = utf8.len(name)
    if not len or len < Config.MinNameLength or len > Config.MaxNameLength then
        return false
    end

    if name:find('[%d<>\"\\;/|{}%[%]%%@#%$%^%(%)=+%*%?]') then
        return false
    end

    if name:find('%s%s') then
        return false
    end

    return true
end

local function isValidBirthdate(dateStr)
    if type(dateStr) ~= 'string' then return false end
    local y, m, d = dateStr:match('^(%d%d%d%d)-(%d%d)-(%d%d)$')
    if not y then return false end

    y, m, d = tonumber(y), tonumber(m), tonumber(d)
    if not y or not m or not d then return false end
    if m < 1 or m > 12 or d < 1 or d > 31 then return false end

    local now = os.date('*t')
    local age = now.year - y
    if now.month < m or (now.month == m and now.day < d) then
        age = age - 1
    end

    return age >= Config.MinAge and age <= Config.MaxAge
end

local function validateCreatePayload(data)
    if type(data) ~= 'table' then return false end
    if not isValidNamePart(data.firstname) or not isValidNamePart(data.lastname) then
        return false
    end
    if not isValidBirthdate(data.birthdate) then
        return false
    end
    if data.gender ~= 0 and data.gender ~= 1 then
        return false
    end
    if type(data.nationality) ~= 'string' or trim(data.nationality) == '' then
        return false
    end
    if trim(data.nationality):find('[<>\"\\;/|{}]') then
        return false
    end
    return true
end

local function sanitizeCreatePayload(data)
    return {
        cid = tonumber(data.cid) or 1,
        firstname = trim(data.firstname):gsub('%s+', ' '),
        lastname = trim(data.lastname):gsub('%s+', ' '),
        birthdate = data.birthdate,
        gender = data.gender == 1 and 1 or 0,
        nationality = trim(data.nationality),
    }
end

local function GiveStarterItems(source)
    local src = source
    local Player = exports['qb-core']:GetPlayer(src)
    for _, v in pairs(sharedStarterItems) do
        local info = {}
        if v.item == 'id_card' then
            info.citizenid = Player.PlayerData.citizenid
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.gender = Player.PlayerData.charinfo.gender
            info.nationality = Player.PlayerData.charinfo.nationality
        elseif v.item == 'driver_license' then
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.type = 'Class C Driver License'
        end
        exports['qb-inventory']:AddItem(src, v.item, v.amount, false, info, 'qb-multicharacter:GiveStarterItems')
    end
end

local function loadHouseData(src)
    if GetResourceState('qb-houses') ~= 'started' then return end

    local HouseGarages = {}
    local Houses = {}
    local result = MySQL.query.await('SELECT * FROM houselocations', {})
    if result[1] ~= nil then
        for _, v in pairs(result) do
            local owned = false
            if tonumber(v.owned) == 1 then
                owned = true
            end
            local garage = v.garage ~= nil and json.decode(v.garage) or {}
            Houses[v.name] = {
                coords = json.decode(v.coords),
                owned = owned,
                price = v.price,
                locked = true,
                adress = v.label,
                tier = v.tier,
                garage = garage,
                decorations = {},
            }
            HouseGarages[v.name] = {
                label = v.label,
                takeVehicle = garage,
            }
        end
    end
    TriggerClientEvent('qb-garages:client:houseGarageConfig', src, HouseGarages)
    TriggerClientEvent('qb-houses:client:setHouseConfig', src, Houses)
end

-- Commands

QBCore.Commands.Add('logout', Lang:t('commands.logout_description'), {}, false, function(source)
    local src = source
    QBCore.Player.Logout(src)
    TriggerClientEvent('qb-multicharacter:client:chooseChar', src)
end, 'admin')

QBCore.Commands.Add('closeNUI', Lang:t('commands.closeNUI_description'), {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-multicharacter:client:closeNUI', src)
end)

-- Events

AddEventHandler('QBCore:Server:PlayerLoaded', function(Player)
    Wait(1000) -- 1 second should be enough to do the preloading in other resources
    hasDonePreloading[Player.PlayerData.source] = true
end)

AddEventHandler('QBCore:Server:OnPlayerUnload', function(src)
    hasDonePreloading[src] = false
end)

RegisterNetEvent('qb-multicharacter:server:disconnect', function()
    local src = source
    DropPlayer(src, Lang:t('commands.droppedplayer'))
end)

RegisterNetEvent('qb-multicharacter:server:loadUserData', function(cData)
    local src = source
    if type(cData) ~= 'table' or type(cData.citizenid) ~= 'string' then return end

    if QBCore.Player.Login(src, cData.citizenid) then
        repeat
            Wait(10)
        until hasDonePreloading[src]
        print('^2[qb-core]^7 ' .. GetPlayerName(src) .. ' (Citizen ID: ' .. cData.citizenid .. ') has successfully loaded!')
        QBCore.Commands.Refresh(src)
        loadHouseData(src)
        if Config.SkipSelection then
            local coords = json.decode(cData.position)
            if type(coords) ~= 'table' or not coords.x or not coords.y or not coords.z then
                coords = {
                    x = Config.DefaultSpawn.x,
                    y = Config.DefaultSpawn.y,
                    z = Config.DefaultSpawn.z,
                    w = Config.DefaultSpawn.w or 0.0,
                }
            end
            TriggerClientEvent('qb-multicharacter:client:spawnLastLocation', src, coords, cData)
        else
            if GetResourceState('qb-apartments') == 'started' then
                TriggerClientEvent('apartments:client:setupSpawnUI', src, cData)
            else
                TriggerClientEvent('qb-spawn:client:setupSpawns', src, cData, false, nil)
                TriggerClientEvent('qb-spawn:client:openUI', src, true)
            end
        end
        TriggerEvent('qb-log:server:CreateLog', 'joinleave', 'Loaded', 'green', '**' .. GetPlayerName(src) .. '** (<@' .. (QBCore.Functions.GetIdentifier(src, 'discord'):gsub('discord:', '') or 'unknown') .. '> |  ||' .. (QBCore.Functions.GetIdentifier(src, 'ip') or 'undefined') .. '|| | ' .. (QBCore.Functions.GetIdentifier(src, 'license') or 'undefined') .. ' | ' .. cData.citizenid .. ' | ' .. src .. ') loaded..')
    end
end)

RegisterNetEvent('qb-multicharacter:server:createCharacter', function(data)
    local src = source
    if not validateCreatePayload(data) then
        TriggerClientEvent('QBCore:Notify', src, 'Geçersiz karakter bilgisi.', 'error')
        return
    end

    local license = QBCore.Functions.GetIdentifier(src, 'license')
    if not license then return end

    local maxChars = getMaxCharacters(license)
    if countCharacters(license) >= maxChars then
        TriggerClientEvent('QBCore:Notify', src, 'Karakter limitine ulaştınız.', 'error')
        return
    end

    local clean = sanitizeCreatePayload(data)
    if clean.cid ~= 1 then
        TriggerClientEvent('QBCore:Notify', src, 'Geçersiz karakter slotu.', 'error')
        return
    end

    local newData = {
        cid = clean.cid,
        charinfo = clean,
    }

    if QBCore.Player.Login(src, false, newData) then
        repeat
            Wait(10)
        until hasDonePreloading[src]
        if GetResourceState('qb-apartments') == 'started' and Apartments.Starting then
            local randbucket = (GetPlayerPed(src) .. math.random(1, 999))
            SetPlayerRoutingBucket(src, randbucket)
            print('^2[qb-core]^7 ' .. GetPlayerName(src) .. ' has successfully loaded!')
            QBCore.Commands.Refresh(src)
            loadHouseData(src)
            TriggerClientEvent('qb-multicharacter:client:closeNUI', src)
            TriggerClientEvent('apartments:client:setupSpawnUI', src, newData)
            GiveStarterItems(src)
        else
            print('^2[qb-core]^7 ' .. GetPlayerName(src) .. ' has successfully loaded!')
            QBCore.Commands.Refresh(src)
            loadHouseData(src)
            TriggerClientEvent('qb-multicharacter:client:closeNUIdefault', src)
            GiveStarterItems(src)
            TriggerEvent('apartments:client:SetHomeBlip', nil)
        end
    end
end)

RegisterNetEvent('qb-multicharacter:server:deleteCharacter', function(citizenid)
    local src = source
    if type(citizenid) ~= 'string' or citizenid == '' then return end
    if not Config.EnableDeleteButton then return end
    QBCore.Player.DeleteCharacter(src, citizenid)
    TriggerClientEvent('QBCore:Notify', src, Lang:t('notifications.char_deleted'), 'success')
end)

-- Callbacks

QBCore.Functions.CreateCallback('qb-multicharacter:server:GetUserCharacters', function(source, cb)
    local src = source
    local license = QBCore.Functions.GetIdentifier(src, 'license')

    MySQL.query('SELECT * FROM players WHERE license = ?', { license }, function(result)
        cb(result)
    end)
end)

QBCore.Functions.CreateCallback('qb-multicharacter:server:GetServerLogs', function(_, cb)
    MySQL.query('SELECT * FROM server_logs', {}, function(result)
        cb(result)
    end)
end)

QBCore.Functions.CreateCallback('qb-multicharacter:server:GetNumberOfCharacters', function(source, cb)
    local license = QBCore.Functions.GetIdentifier(source, 'license')
    cb(getMaxCharacters(license), Countries)
end)

QBCore.Functions.CreateCallback('qb-multicharacter:server:setupCharacters', function(source, cb)
    local license = QBCore.Functions.GetIdentifier(source, 'license')
    local plyChars = {}
    MySQL.query('SELECT * FROM players WHERE license = ?', { license }, function(result)
        for i = 1, (#result), 1 do
            result[i].charinfo = json.decode(result[i].charinfo)
            result[i].money = json.decode(result[i].money)
            result[i].job = json.decode(result[i].job)
            plyChars[#plyChars + 1] = result[i]
        end
        cb(plyChars)
    end)
end)

QBCore.Functions.CreateCallback('qb-multicharacter:server:getSkin', function(_, cb, cid)
    local result = MySQL.query.await('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', { cid, 1 })
    if result[1] ~= nil then
        cb(result[1].model, result[1].skin)
    else
        cb(nil)
    end
end)

QBCore.Commands.Add('deletechar', Lang:t('commands.deletechar_description'), { { name = Lang:t('commands.citizenid'), help = Lang:t('commands.citizenid_help') } }, false, function(source, args)
    if args and args[1] then
        QBCore.Player.ForceDeleteCharacter(tostring(args[1]))
        TriggerClientEvent('QBCore:Notify', source, Lang:t('notifications.deleted_other_char', { citizenid = tostring(args[1]) }))
    else
        TriggerClientEvent('QBCore:Notify', source, Lang:t('notifications.forgot_citizenid'), 'error')
    end
end, 'god')
