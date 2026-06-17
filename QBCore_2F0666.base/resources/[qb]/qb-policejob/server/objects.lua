local QBCore = exports['qb-core']:GetCoreObject({ 'Functions' })
local Objects = {}

local function isLeoOnDuty(src)
    local Player = QBCore.Functions.GetPlayer(src)
    return Player and Player.PlayerData.job.type == 'leo' and Player.PlayerData.job.onduty
end

local function CreateObjectId()
    if Objects then
        local objectId = math.random(10000, 99999)
        while Objects[objectId] do
            objectId = math.random(10000, 99999)
        end
        return objectId
    else
        local objectId = math.random(10000, 99999)
        return objectId
    end
end

RegisterNetEvent('police:server:spawnObject', function(type)
    local src = source
    if not isLeoOnDuty(src) then return end
    local objectId = CreateObjectId()
    Objects[objectId] = type
    TriggerClientEvent('police:client:spawnObject', src, objectId, type, src)
end)

RegisterNetEvent('police:server:deleteObject', function(objectId)
    local src = source
    if not isLeoOnDuty(src) then return end
    TriggerClientEvent('police:client:removeObject', -1, objectId)
end)

RegisterNetEvent('police:server:SyncSpikes', function(table)
    local src = source
    if not isLeoOnDuty(src) then return end
    TriggerClientEvent('police:client:SyncSpikes', -1, table)
end)
