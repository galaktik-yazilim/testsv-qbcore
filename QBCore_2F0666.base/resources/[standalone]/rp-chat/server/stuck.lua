local QBCore = exports['qb-core']:GetCoreObject()

-- server/main.lua içindeki CheckCooldown ile aynı bucket (rp-chat)

local function notify(source, text, nType)
    TriggerClientEvent('rp-chat:client:notify', source, text, nType or 'error')
end

local cooldowns = {}

local function checkCooldown(source, bucket, ms)
    ms = ms or Config.CommandCooldownMs
    local now = GetGameTimer()
    local key = ('%s:%s'):format(source, bucket)
    if cooldowns[key] and (now - cooldowns[key]) < ms then
        return false
    end
    cooldowns[key] = now
    return true
end

AddEventHandler('playerDropped', function()
    local src = source
    for key in pairs(cooldowns) do
        if key:find('^' .. src .. ':') then
            cooldowns[key] = nil
        end
    end
end)

local function clearInsideMetadata(source)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end

    Player.Functions.SetMetaData('inside', {
        house = nil,
        apartment = { apartmentType = nil, apartmentId = nil },
    })
end

QBCore.Commands.Add('fdoor', 'Bulunduğun binanın çıkış kapısına ışınlan', {}, false, function(source)
    if not checkCooldown(source, 'cmd:fdoor', Config.StuckRecovery.FdoorCooldownMs) then
        notify(source, 'Biraz bekle, sonra tekrar dene.', 'warning')
        return
    end

    TriggerClientEvent('rp-chat:client:fdoor', source)
end, 'user')

QBCore.Commands.Add('dimsifirla', 'Ana harita boyutuna (dim 0) dön — interior sıkışması', {}, false, function(source)
    if not checkCooldown(source, 'cmd:dimsifirla', Config.StuckRecovery.DimResetCooldownMs) then
        notify(source, 'Biraz bekle, sonra tekrar dene.', 'warning')
        return
    end

    local bucket = GetPlayerRoutingBucket(source)

    if bucket ~= 0 then
        QBCore.Functions.SetPlayerBucket(source, 0)
    end

    clearInsideMetadata(source)

    if bucket == 0 then
        notify(source, 'Zaten ana boyuttasın; iç mekân kaydı sıfırlandı.', 'primary')
    end

    TriggerClientEvent('rp-chat:client:dimResetDone', source, bucket)
end, 'user')
