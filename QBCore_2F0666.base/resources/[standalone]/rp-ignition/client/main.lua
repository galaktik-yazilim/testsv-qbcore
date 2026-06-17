local QBCore = exports['qb-core']:GetCoreObject()

local ignitionOn = false
local currentVehicle = 0
local lastToggle = 0

local function canUseIgnition(vehicle)
    if not vehicle or vehicle == 0 then return false end
    if GetVehicleClass(vehicle) == 13 then return false end
    if GetResourceState('qb-vehiclekeys') ~= 'started' then return true end
    return exports['qb-vehiclekeys']:CanControlEngine(vehicle)
end

local function setIgnition(vehicle, state, notifyChat)
    ignitionOn = state
    SetVehicleEngineOn(vehicle, state, false, true)
    if notifyChat then
        TriggerServerEvent('rp-chat:server:vehicleIgnition', state)
    end
end

local function toggleIgnition()
    local ped = PlayerPedId()
    if not IsPedInAnyVehicle(ped, false) then return end

    local vehicle = GetVehiclePedIsIn(ped, false)
    if GetPedInVehicleSeat(vehicle, -1) ~= ped then return end
    if GetGameTimer() - lastToggle < 600 then return end

    if canUseIgnition(vehicle) then
        lastToggle = GetGameTimer()
        setIgnition(vehicle, not ignitionOn, true)
    else
        QBCore.Functions.Notify('Aracın anahtarı yok.', 'error')
    end
end

RegisterNetEvent('QBCore:Client:EnteredVehicle', function(data)
    if not data or data.seat ~= -1 then return end
    currentVehicle = data.vehicle
    ignitionOn = false
    if data.vehicle and data.vehicle ~= 0 then
        SetVehicleEngineOn(data.vehicle, false, true, true)
    end
end)

RegisterNetEvent('QBCore:Client:LeftVehicle', function()
    currentVehicle = 0
    ignitionOn = false
end)

RegisterCommand('toggleignition', function()
    toggleIgnition()
end, false)

CreateThread(function()
    while true do
        local sleep = 500
        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, false) then
            local vehicle = GetVehiclePedIsIn(ped, false)
            if GetPedInVehicleSeat(vehicle, -1) == ped then
                currentVehicle = vehicle
                if not ignitionOn then
                    sleep = 0
                else
                    sleep = 200
                end

                if not ignitionOn then
                    SetVehicleEngineOn(vehicle, false, true, true)
                end
            end
        elseif currentVehicle ~= 0 then
            currentVehicle = 0
            ignitionOn = false
        end

        Wait(sleep)
    end
end)
