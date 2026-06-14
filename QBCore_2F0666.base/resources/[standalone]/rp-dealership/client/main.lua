local QBCore = exports['qb-core']:GetCoreObject()
local dealershipPeds = {}
local targetZones = {}
local currentDealership = nil
local nuiOpen = false
local initialized = false
local hasTarget = GetResourceState('qb-target') == 'started'

local function getInteractCoords(data)
    local c = data.interact
    if c then
        return vector3(c.x, c.y, c.z), c.w or 0.0
    end
    if data.npc and data.npc.coords then
        return vector3(data.npc.coords.x, data.npc.coords.y, data.npc.coords.z), data.npc.coords.w or 0.0
    end
    if data.marker and data.marker.coords then
        return data.marker.coords, 0.0
    end
    return nil, 0.0
end

local function loadModel(model)
    local hash = type(model) == 'number' and model or joaat(model)
    if not IsModelInCdimage(hash) then return false end
    RequestModel(hash)
    local timeout = 0
    while not HasModelLoaded(hash) do
        Wait(10)
        timeout = timeout + 10
        if timeout > 10000 then return false end
    end
    return hash
end

local function setFuel(vehicle, amount)
    if GetResourceState('LegacyFuel') == 'started' then
        exports['LegacyFuel']:SetFuel(vehicle, amount)
    elseif GetResourceState('qb-fuel') == 'started' then
        exports['qb-fuel']:SetFuel(vehicle, amount)
    end
end

local function ensurePlate(vehicle, plate)
    CreateThread(function()
        local tries = 0
        while tries < 20 do
            if GetVehicleNumberPlateText(vehicle) == plate then return end
            SetVehicleNumberPlateText(vehicle, plate)
            tries = tries + 1
            Wait(250)
        end
    end)
end

local function openDealership(dealershipId)
    if nuiOpen then return end
    if not LocalPlayer.state.isLoggedIn then
        QBCore.Functions.Notify('Karakter yüklenene kadar bekleyin.', 'error')
        return
    end
    QBCore.Functions.TriggerCallback('rp-dealership:server:getCatalog', function(data)
        if not data then
            QBCore.Functions.Notify('Galeri yüklenemedi.', 'error')
            return
        end
        currentDealership = dealershipId
        nuiOpen = true
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'open',
            dealership = data,
        })
    end, dealershipId)
end

local function closeDealership()
    if not nuiOpen then return end
    nuiOpen = false
    currentDealership = nil
    SetNuiFocus(false, false)
    SendNUIMessage({ action = 'close' })
end

local function addTargetZone(dealershipId, data, coords)
    if not Config.UseTarget or not hasTarget then return end
    local zoneName = 'rp_dealership_' .. dealershipId
    if targetZones[zoneName] then return end

    exports['qb-target']:AddCircleZone(zoneName, coords, 1.2, {
        name = zoneName,
        debugPoly = false,
        useZ = true,
    }, {
        options = {
            {
                icon = 'fas fa-car',
                label = 'Galeriyi Aç',
                action = function()
                    openDealership(dealershipId)
                end,
            },
        },
        distance = data.interactDistance or 2.5,
    })
    targetZones[zoneName] = true
end

local function spawnNpc(dealershipId, data, coords, heading)
    if not Config.SpawnNpc or not data.npc then return end
    if dealershipPeds[dealershipId] and DoesEntityExist(dealershipPeds[dealershipId]) then return end

    local hash = loadModel(data.npc.model)
    if not hash then
        print(('[rp-dealership] NPC model yüklenemedi: %s'):format(data.npc.model))
        return
    end

    local ped = CreatePed(0, hash, coords.x, coords.y, coords.z - 1.0, heading, false, false)
    SetEntityHeading(ped, heading)
    PlaceEntityOnGroundProperly(ped)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    if data.npc.scenario then
        TaskStartScenarioInPlace(ped, data.npc.scenario, 0, true)
    end
    SetModelAsNoLongerNeeded(hash)

    dealershipPeds[dealershipId] = ped

    if Config.UseTarget and hasTarget then
        exports['qb-target']:AddTargetEntity(ped, {
            options = {
                {
                    icon = 'fas fa-car',
                    label = 'Galeriyi Aç',
                    action = function()
                        openDealership(dealershipId)
                    end,
                },
            },
            distance = data.interactDistance or 2.5,
        })
    end
end

local function initDealerships()
    if initialized then return end
    initialized = true
    hasTarget = GetResourceState('qb-target') == 'started'

    for dealershipId, data in pairs(Config.Dealerships) do
        local coords, heading = getInteractCoords(data)
        if not coords then goto continue end

        addTargetZone(dealershipId, data, coords)
        spawnNpc(dealershipId, data, coords, heading)

        ::continue::
    end
end

CreateThread(function()
    Wait(2000)
    initDealerships()
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(1000)
    initDealerships()
end)

-- Marker + E (her zaman görünür)
CreateThread(function()
    while true do
        local sleep = 1000
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)

        for dealershipId, data in pairs(Config.Dealerships) do
            local point = getInteractCoords(data)
            if point then
                local dist = #(pos - point)
                if dist < 25.0 then
                    sleep = 0

                    if Config.ShowMarker and data.marker then
                        local m = data.marker
                        DrawMarker(
                            m.type or 1,
                            point.x, point.y, point.z - 0.98,
                            0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                            (m.scale and m.scale.x) or 1.0,
                            (m.scale and m.scale.y) or 1.0,
                            (m.scale and m.scale.z) or 0.9,
                            m.color.r, m.color.g, m.color.b, m.color.a,
                            false, false, 2, false, nil, nil, false
                        )
                    end

                    if dist < (data.interactDistance or 2.5) and LocalPlayer.state.isLoggedIn and not nuiOpen then
                        if not (Config.UseTarget and hasTarget) then
                            QBCore.Functions.DrawText3D(point.x, point.y, point.z + 0.35, data.drawText or '[E] Galeriyi Aç')
                        end
                        if IsControlJustReleased(0, 38) then
                            openDealership(dealershipId)
                        end
                    end
                end
            end
        end

        Wait(sleep)
    end
end)

RegisterNetEvent('rp-dealership:client:spawnPurchased', function(dealershipId, model, plate)
    local dealership = Config.Dealerships[dealershipId]
    if not dealership then return end

    closeDealership()

    QBCore.Functions.TriggerCallback('qb-vehicleshop:server:spawnvehicle', function(netId, properties, vehPlate)
        while not NetworkDoesNetworkIdExist(netId) do Wait(10) end
        local veh = NetworkGetEntityFromNetworkId(netId)
        ensurePlate(veh, vehPlate)
        if properties then
            QBCore.Functions.SetVehicleProperties(veh, properties)
        end
        setFuel(veh, 100.0)
        TriggerEvent('vehiclekeys:client:SetOwner', vehPlate)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        SetVehicleEngineOn(veh, true, true, false)
    end, plate, model, dealership.spawn, true)
end)

RegisterNUICallback('close', function(_, cb)
    closeDealership()
    cb('ok')
end)

RegisterNUICallback('buy', function(data, cb)
    if not currentDealership or not data or not data.model then
        cb({ ok = false })
        return
    end
    TriggerServerEvent('rp-dealership:server:buyVehicle', currentDealership, data.model, data.payType or 'cash')
    cb({ ok = true })
end)

RegisterNUICallback('refreshMoney', function(_, cb)
    local PlayerData = QBCore.Functions.GetPlayerData()
    cb({
        cash = PlayerData.money and PlayerData.money.cash or 0,
        bank = PlayerData.money and PlayerData.money.bank or 0,
    })
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    closeDealership()
    for _, ped in pairs(dealershipPeds) do
        if DoesEntityExist(ped) then DeleteEntity(ped) end
    end
    if hasTarget then
        for zoneName in pairs(targetZones) do
            exports['qb-target']:RemoveZone(zoneName)
        end
    end
end)

AddEventHandler('onResourceStart', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    initialized = false
    dealershipPeds = {}
    targetZones = {}
    Wait(2000)
    initDealerships()
end)
