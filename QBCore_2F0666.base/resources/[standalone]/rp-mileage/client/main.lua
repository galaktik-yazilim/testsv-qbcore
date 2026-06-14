local QBCore = exports['qb-core']:GetCoreObject()

local active = nil
local mileageData = {}

local function trimPlate(plate)
    if not plate then return nil end
    return QBCore.Shared.Trim(plate):upper()
end

local function metersToMiles(meters)
    return meters * 0.000621371
end

local function shouldIgnoreVehicle(vehicle)
    if not vehicle or vehicle == 0 then return true end
    local class = GetVehicleClass(vehicle)
    return Config.IgnoreClasses[class] == true
end

local function syncDelta(plate, delta)
    delta = tonumber(delta) or 0
    if delta <= 0 then return end
    TriggerServerEvent('rp-mileage:server:syncDelta', plate, delta)
end

local function flushPending()
    if not active or active.pending <= 0 then return end
    syncDelta(active.plate, active.pending)
    active.pending = 0
end

local function stopTracking()
    if active then
        flushPending()
        active = nil
    end
end

local function loadMileage(plate, cb)
    QBCore.Functions.TriggerCallback('rp-mileage:server:getMileage', function(miles)
        mileageData[plate] = tonumber(miles) or 0.0
        if cb then cb(mileageData[plate]) end
    end, plate)
end

local function startTracking(vehicle, plate)
    plate = trimPlate(plate)
    if not plate then return end

    local function begin(total)
        active = {
            vehicle = vehicle,
            plate = plate,
            total = total,
            lastCoords = GetEntityCoords(vehicle),
            pending = 0.0,
        }
    end

    if mileageData[plate] ~= nil then
        begin(mileageData[plate])
    else
        loadMileage(plate, begin)
    end
end

local function tickMileage()
    if not active or not DoesEntityExist(active.vehicle) then return end

    local ped = PlayerPedId()
    if GetPedInVehicleSeat(active.vehicle, -1) ~= ped then return end
    if GetEntitySpeed(active.vehicle) < Config.MinSpeed then return end

    local coords = GetEntityCoords(active.vehicle)
    local dist = #(coords - active.lastCoords)
    if dist <= 0 or dist > Config.MaxDeltaPerTick then
        active.lastCoords = coords
        return
    end

    local deltaMiles = metersToMiles(dist)
    active.total = active.total + deltaMiles
    active.pending = active.pending + deltaMiles
    mileageData[active.plate] = active.total
    active.lastCoords = coords
end

-- Sürüş takibi
CreateThread(function()
    while true do
        Wait(500)
        if active then
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, false)
            if veh == 0 or veh ~= active.vehicle or GetPedInVehicleSeat(veh, -1) ~= ped then
                stopTracking()
            else
                tickMileage()
            end
        end
    end
end)

-- Periyodik DB kayıt
CreateThread(function()
    while true do
        Wait(Config.SyncIntervalMs)
        flushPending()
    end
end)

-- Sürücü koltuğuna geçiş / relog (araç içinde)
CreateThread(function()
    while true do
        Wait(1500)
        if not active and LocalPlayer.state.isLoggedIn then
            local ped = PlayerPedId()
            local vehicle = GetVehiclePedIsIn(ped, false)
            if vehicle ~= 0 and GetPedInVehicleSeat(vehicle, -1) == ped and not shouldIgnoreVehicle(vehicle) then
                local plate = QBCore.Functions.GetPlate(vehicle)
                startTracking(vehicle, plate)
            end
        end
    end
end)

AddEventHandler('gameEventTriggered', function(event)
    if event ~= 'CEventNetworkPlayerEnteredVehicle' then return end

    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    if vehicle == 0 or shouldIgnoreVehicle(vehicle) then return end
    if GetPedInVehicleSeat(vehicle, -1) ~= ped then return end

    stopTracking()
    local plate = QBCore.Functions.GetPlate(vehicle)
    startTracking(vehicle, plate)
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    stopTracking()
end)

exports('GetCurrentMileage', function()
    if active then return active.total end
    return 0.0
end)

exports('GetMileageByPlate', function(plate)
    plate = trimPlate(plate)
    if not plate then return 0.0 end
    if active and active.plate == plate then return active.total end
    return mileageData[plate] or 0.0
end)
