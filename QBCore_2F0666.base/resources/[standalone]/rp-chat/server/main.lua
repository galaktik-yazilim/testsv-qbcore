local QBCore = exports['qb-core']:GetCoreObject()

local cooldowns = {}

local function GetCharName(source)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        local c = Player.PlayerData.charinfo
        return c.firstname .. ' ' .. c.lastname
    end
    return GetPlayerName(source)
end

local function GetNearbyPlayers(source, range)
    local ped = GetPlayerPed(source)
    if ped == 0 then return {} end

    local coords = GetEntityCoords(ped)
    local nearby = {}

    for _, playerId in ipairs(QBCore.Functions.GetPlayers()) do
        local targetPed = GetPlayerPed(playerId)
        if targetPed ~= 0 then
            local tCoords = GetEntityCoords(targetPed)
            if playerId == source or #(coords - tCoords) < range then
                nearby[#nearby + 1] = playerId
            end
        end
    end

    return nearby
end

local function SendChat(target, color, label, message)
    TriggerClientEvent('chat:addMessage', target, {
        color = color,
        multiline = true,
        args = { label, message or '' },
    })
end

local function NotifyPlayer(source, text, notifyType)
    TriggerClientEvent('rp-chat:client:notify', source, text, notifyType or 'error')
end

local function BroadcastProximity(source, color, label, message, range)
    range = range or Config.ProximityRange
    for _, playerId in ipairs(GetNearbyPlayers(source, range)) do
        SendChat(playerId, color, label, message)
    end
end

local function SanitizeMessage(raw)
    if type(raw) ~= 'string' then return nil end
    local msg = raw:gsub('[~<].-[>~]', '')
    if #msg > Config.MaxMessageLength then
        msg = msg:sub(1, Config.MaxMessageLength)
    end
    if msg:match('^%s*$') then return nil end
    return msg
end

local function CheckCooldown(source, bucket, ms)
    ms = ms or Config.CommandCooldownMs
    local now = GetGameTimer()
    local key = ('%s:%s'):format(source, bucket)
    if cooldowns[key] and (now - cooldowns[key]) < ms then
        return false
    end
    cooldowns[key] = now
    return true
end

local function IsDriver(source)
    local ped = GetPlayerPed(source)
    if ped == 0 then return false end
    local veh = GetVehiclePedIsIn(ped, false)
    if veh == 0 then return false end
    return GetPedInVehicleSeat(veh, -1) == ped
end

local function AddProximityCommand(name, help, range, color, formatFn, permission)
    QBCore.Commands.Add(name, help, {
        { name = 'mesaj', help = 'Mesajınız' },
    }, false, function(source, args)
        if #args < 1 then
            NotifyPlayer(source, 'Mesaj yazmalısın.', 'error')
            return
        end
        if not CheckCooldown(source, 'cmd:' .. name) then
            NotifyPlayer(source, 'Çok hızlı yazıyorsun, biraz bekle.', 'warning')
            return
        end

        local msg = SanitizeMessage(table.concat(args, ' '))
        if not msg then return end

        local label, body = formatFn(GetCharName(source), msg)
        BroadcastProximity(source, color, label, body, range)
    end, permission or 'user')
end

AddEventHandler('playerDropped', function()
    local src = source
    for key in pairs(cooldowns) do
        if key:find('^' .. src .. ':') then
            cooldowns[key] = nil
        end
    end
end)

AddEventHandler('chatMessage', function(source, _, message)
    if source == 0 then return end
    if type(message) ~= 'string' or message:sub(1, 1) == '/' then return end

    CancelEvent()

    if not CheckCooldown(source, 'say') then return end

    local msg = SanitizeMessage(message)
    if not msg then return end

    BroadcastProximity(source, Config.Colors.say, GetCharName(source) .. ' diyor ki:', msg)
end)

AddProximityCommand('me', 'Yakındakilere eylem mesajı gönder', Config.ProximityRange, Config.Colors.me, function(charName, msg)
    return '* ' .. charName, msg
end)

AddProximityCommand('b', 'Yakındaki oyunculara OOC mesaj gönder', Config.ProximityRange, Config.Colors.b, function(charName, msg)
    return '(( ' .. charName .. ' ))', msg
end)

AddProximityCommand('do', 'Ortam eylemi belirt', Config.ProximityRange, Config.Colors.do_cmd, function(charName, msg)
    return '** ' .. msg .. ' (( ' .. charName .. ' ))', ''
end)

AddProximityCommand('s', 'Fısıldayarak konuş (~3m)', Config.WhisperRange, Config.Colors.whisper, function(charName, msg)
    return charName .. ' fısıldar:', msg
end)

AddProximityCommand('w', 'Bağırarak konuş (~40m)', Config.ShoutRange, Config.Colors.shout, function(charName, msg)
    return charName .. ' bağırır:', msg
end)

exports('BroadcastProximity', BroadcastProximity)
exports('GetCharName', GetCharName)
exports('Notify', NotifyPlayer)

local function HandleVehicleChatAction(source, bucket, buildMessage)
    if not IsDriver(source) then return end
    if not CheckCooldown(source, bucket, Config.VehicleActionCooldownMs) then return end
    BroadcastProximity(source, Config.Colors.me, buildMessage(GetCharName(source)), '')
end

RegisterNetEvent('rp-chat:server:vehicleIgnition', function(engineOn)
    if type(engineOn) ~= 'boolean' then return end
    HandleVehicleChatAction(source, 'veh:ignition', function(name)
        return engineOn
            and (name .. ' isimli kişi aracı çalıştırdı')
            or (name .. ' isimli kişi aracı durdurdu')
    end)
end)

RegisterNetEvent('rp-chat:server:vehicleLock', function(locked)
    if type(locked) ~= 'boolean' then return end
    HandleVehicleChatAction(source, 'veh:lock', function(name)
        return locked
            and ('* ' .. name .. ' aracı kilitler')
            or ('* ' .. name .. ' aracın kilidini açar')
    end)
end)

RegisterNetEvent('rp-chat:server:vehicleSeatbelt', function(buckled)
    if type(buckled) ~= 'boolean' then return end
    local ped = GetPlayerPed(source)
    if ped == 0 or GetVehiclePedIsIn(ped, false) == 0 then return end
    if not CheckCooldown(source, 'veh:seatbelt', Config.VehicleActionCooldownMs) then return end

    local charName = GetCharName(source)
    local msg = buckled
        and ('* ' .. charName .. ' emniyet kemerini takar')
        or ('* ' .. charName .. ' emniyet kemerini çıkartır')
    BroadcastProximity(source, Config.Colors.me, msg, '')
end)
