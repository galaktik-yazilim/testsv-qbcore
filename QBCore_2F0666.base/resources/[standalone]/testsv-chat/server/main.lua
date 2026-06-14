local QBCore = exports['qb-core']:GetCoreObject()

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

local function BroadcastProximity(source, color, label, message, range)
    range = range or Config.ProximityRange
    for _, playerId in ipairs(GetNearbyPlayers(source, range)) do
        SendChat(playerId, color, label, message)
    end
end

-- Normal konuşma: yakınlık bazlı (global yerine)
AddEventHandler('chatMessage', function(source, name, message)
    if source == 0 then return end
    if type(message) ~= 'string' or message:sub(1, 1) == '/' then return end

    CancelEvent()

    local charName = GetCharName(source)
    BroadcastProximity(source, Config.Colors.say, charName .. ' diyor ki:', message)
end)

-- /b — yerel OOC (( mesaj ))
QBCore.Commands.Add('b', 'Yakındaki oyunculara OOC mesaj gönder', {
    { name = 'mesaj', help = 'OOC mesajınız' },
}, false, function(source, args)
    if #args < 1 then
        TriggerClientEvent('QBCore:Notify', source, 'Mesaj yazmalısın.', 'error')
        return
    end

    local msg = table.concat(args, ' '):gsub('[~<].-[>~]', '')
    local charName = GetCharName(source)
    BroadcastProximity(source, Config.Colors.b, '(( ' .. charName .. ' ))', msg)
end, 'user')

-- /do — ortam / eylem açıklaması
QBCore.Commands.Add('do', 'Ortam eylemi belirt', {
    { name = 'mesaj', help = 'Ortam mesajı' },
}, false, function(source, args)
    if #args < 1 then
        TriggerClientEvent('QBCore:Notify', source, 'Mesaj yazmalısın.', 'error')
        return
    end

    local msg = table.concat(args, ' '):gsub('[~<].-[>~]', '')
    local charName = GetCharName(source)
    BroadcastProximity(source, Config.Colors.do_cmd, '** ' .. msg .. ' (( ' .. charName .. ' ))', '')
end, 'user')

exports('BroadcastProximity', BroadcastProximity)
exports('GetCharName', GetCharName)
