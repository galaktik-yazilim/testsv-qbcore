local QBCore = exports['qb-core']:GetCoreObject()

local function normalizePlate(plate)
    if not plate then return nil end
    return QBCore.Shared.Trim(plate):gsub('%s+', ''):upper()
end

local function isOwnedPlate(plate)
    plate = normalizePlate(plate)
    if not plate then return false end
    return MySQL.scalar.await(
        'SELECT 1 FROM player_vehicles WHERE UPPER(REPLACE(plate, \' \', \'\')) = ? LIMIT 1',
        { plate }
    ) ~= nil
end

local function ensureMileageColumn()
    pcall(function()
        MySQL.query.await([[
            ALTER TABLE `player_vehicles`
            MODIFY COLUMN `drivingdistance` FLOAT NULL DEFAULT 0
        ]])
    end)
    MySQL.query.await('UPDATE player_vehicles SET drivingdistance = 0 WHERE drivingdistance IS NULL')
end

AddEventHandler('onResourceStart', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    ensureMileageColumn()
end)

QBCore.Functions.CreateCallback('rp-mileage:server:getMileage', function(_, cb, plate)
    plate = normalizePlate(plate)
    if not plate then return cb(0.0) end

    local row = MySQL.single.await(
        'SELECT drivingdistance FROM player_vehicles WHERE UPPER(REPLACE(plate, \' \', \'\')) = ? LIMIT 1',
        { plate }
    )
    if not row then return cb(0.0) end

    cb(tonumber(row.drivingdistance) or 0.0)
end)

RegisterNetEvent('rp-mileage:server:syncDelta', function(plate, delta)
    plate = normalizePlate(plate)
    delta = tonumber(delta) or 0
    if not plate or delta <= 0 then return end
    if not isOwnedPlate(plate) then return end

    MySQL.update.await(
        'UPDATE player_vehicles SET drivingdistance = COALESCE(drivingdistance, 0) + ? WHERE UPPER(REPLACE(plate, \' \', \'\')) = ?',
        { delta, plate }
    )
end)

exports('GetMileage', function(plate)
    plate = normalizePlate(plate)
    if not plate then return 0.0 end
    local row = MySQL.single.await(
        'SELECT drivingdistance FROM player_vehicles WHERE UPPER(REPLACE(plate, \' \', \'\')) = ? LIMIT 1',
        { plate }
    )
    if not row then return 0.0 end
    return tonumber(row.drivingdistance) or 0.0
end)
