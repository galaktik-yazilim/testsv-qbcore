local QBCore = exports['qb-core']:GetCoreObject()

local function trimPlate(plate)
    if not plate then return nil end
    return QBCore.Shared.Trim(plate):upper()
end

local function isOwnedPlate(plate)
    plate = trimPlate(plate)
    if not plate then return false end
    return MySQL.scalar.await('SELECT 1 FROM player_vehicles WHERE plate = ? LIMIT 1', { plate }) ~= nil
end

AddEventHandler('onResourceStart', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    MySQL.query.await('UPDATE player_vehicles SET drivingdistance = 0 WHERE drivingdistance IS NULL')
end)

QBCore.Functions.CreateCallback('rp-mileage:server:getMileage', function(_, cb, plate)
    plate = trimPlate(plate)
    if not plate then return cb(0.0) end

    local row = MySQL.single.await('SELECT drivingdistance FROM player_vehicles WHERE plate = ? LIMIT 1', { plate })
    if not row then return cb(0.0) end

    cb(tonumber(row.drivingdistance) or 0.0)
end)

RegisterNetEvent('rp-mileage:server:syncDelta', function(plate, delta)
    plate = trimPlate(plate)
    delta = tonumber(delta) or 0
    if not plate or delta <= 0 then return end
    if not isOwnedPlate(plate) then return end

    MySQL.update.await(
        'UPDATE player_vehicles SET drivingdistance = COALESCE(drivingdistance, 0) + ? WHERE plate = ?',
        { delta, plate }
    )
end)

exports('GetMileage', function(plate)
    plate = trimPlate(plate)
    if not plate then return 0.0 end
    local row = MySQL.single.await('SELECT drivingdistance FROM player_vehicles WHERE plate = ? LIMIT 1', { plate })
    if not row then return 0.0 end
    return tonumber(row.drivingdistance) or 0.0
end)
