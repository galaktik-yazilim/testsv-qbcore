local QBCore = exports['qb-core']:GetCoreObject()

local syncState = {}

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

local function getDriverPlate(source)
    local ped = GetPlayerPed(source)
    if ped == 0 then return nil end
    local veh = GetVehiclePedIsIn(ped, false)
    if veh == 0 then return nil end
    if GetPedInVehicleSeat(veh, -1) ~= ped then return nil end
    return normalizePlate(GetVehicleNumberPlateText(veh))
end

local function canSync(source, plate, delta)
    delta = tonumber(delta) or 0
    if delta <= 0 or delta > Config.MaxDeltaPerTick then return false end
    if not isOwnedPlate(plate) then return false end

    local driverPlate = getDriverPlate(source)
    if not driverPlate or driverPlate ~= plate then return false end

    local now = os.time()
    local st = syncState[source] or { count = 0, window = now, last = 0 }

    if now - st.window >= 60 then
        st.count = 0
        st.window = now
    end
    if st.count >= Config.MaxSyncsPerMinute then return false end
    if now - st.last < Config.MinSyncIntervalSec then return false end

    st.count = st.count + 1
    st.last = now
    syncState[source] = st
    return true
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

AddEventHandler('playerDropped', function()
    syncState[source] = nil
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
    if not plate then return end
    if not canSync(source, plate, delta) then return end

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
