local QBCore = exports['qb-core']:GetCoreObject()
local targetZones = {}
local dealershipBlips = {}
local currentDealership = nil
local nuiOpen = false
local initialized = false
local hasTarget = GetResourceState('qb-target') == 'started'

local function getInteractCoords(data)
    local c = data.interact
    if c then
        return vector3(c.x, c.y, c.z), c.w or 0.0
    end
    if data.marker and data.marker.coords then
        return data.marker.coords, 0.0
    end
    return nil, 0.0
end

local function setFuel(vehicle, amount)
    if GetResourceState('qb-fuel') == 'started' then
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

local function setModuleUiFocus(enabled)
    if GetResourceState('rp-chat') == 'started' then
        if enabled then
            pcall(function() exports['rp-chat']:OpenModuleUi() end)
        else
            pcall(function() exports['rp-chat']:CloseModuleUi() end)
        end
        return
    end
    SetNuiFocusKeepInput(false)
    SetNuiFocus(enabled, enabled)
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
        setModuleUiFocus(true)
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
    setModuleUiFocus(false)
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
                label = data.label or 'LS Cars',
                action = function()
                    openDealership(dealershipId)
                end,
            },
        },
        distance = data.interactDistance or 2.5,
    })
    targetZones[zoneName] = true
end

local function createBlip(dealershipId, data)
    local blipCfg = data.blip
    if not blipCfg or blipCfg.enabled == false then return end
    if dealershipBlips[dealershipId] then return end

    local coords = getInteractCoords(data)
    if not coords then return end

    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blip, blipCfg.sprite or 326)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, blipCfg.scale or 0.85)
    SetBlipAsShortRange(blip, blipCfg.shortRange ~= false)
    SetBlipColour(blip, blipCfg.color or 2)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(blipCfg.label or data.label or 'LS Cars')
    EndTextCommandSetBlipName(blip)
    dealershipBlips[dealershipId] = blip
end

local function removeBlips()
    for dealershipId, blip in pairs(dealershipBlips) do
        if DoesBlipExist(blip) then
            RemoveBlip(blip)
        end
        dealershipBlips[dealershipId] = nil
    end
end

local function isShowroomVehicle(veh)
    if not DoesEntityExist(veh) then return false end
    if GetPedInVehicleSeat(veh, -1) ~= 0 then return false end

    local plate = (GetVehicleNumberPlateText(veh) or ''):gsub('%s+', ''):upper()
    if plate == 'BUYME' or plate:find('BUY') then return true end

    if IsEntityPositionFrozen(veh) and GetVehicleDoorLockStatus(veh) == 3 then
        return true
    end

    return false
end

local function cleanupAreaNpcs(center, radius)
    for _, ped in ipairs(GetGamePool('CPed')) do
        if DoesEntityExist(ped) and not IsPedAPlayer(ped) and ped ~= PlayerPedId() then
            if #(GetEntityCoords(ped) - center) < radius then
                SetEntityAsMissionEntity(ped, true, true)
                DeleteEntity(ped)
            end
        end
    end
end

local function cleanupShowroomVehicles()
    for _, data in pairs(Config.Dealerships) do
        local center = getInteractCoords(data)
        if not center then goto continue end

        local radius = data.cleanupRadius or 90.0
        cleanupAreaNpcs(center, radius)

        for _, veh in ipairs(GetGamePool('CVehicle')) do
            if DoesEntityExist(veh) and #(GetEntityCoords(veh) - center) < radius and isShowroomVehicle(veh) then
                SetEntityAsMissionEntity(veh, true, true)
                DeleteVehicle(veh)
            end
        end

        ::continue::
    end
end

local function initDealerships()
    if initialized then return end
    initialized = true
    hasTarget = GetResourceState('qb-target') == 'started'

    cleanupShowroomVehicles()

    for dealershipId, data in pairs(Config.Dealerships) do
        local coords = getInteractCoords(data)
        if not coords then goto continue end

        createBlip(dealershipId, data)
        addTargetZone(dealershipId, data, coords)

        ::continue::
    end
end

CreateThread(function()
    Wait(2000)
    initDealerships()
end)

-- Eski qb-vehicleshop vitrin araçlarını periyodik temizle (yakındayken)
CreateThread(function()
    while true do
        Wait(15000)
        if not LocalPlayer.state.isLoggedIn then goto continue end

        local pos = GetEntityCoords(PlayerPedId())
        local nearDealership = false
        for _, data in pairs(Config.Dealerships) do
            local center = getInteractCoords(data)
            if center and #(pos - center) < ((data.cleanupRadius or 90.0) + 50.0) then
                nearDealership = true
                break
            end
        end
        if nearDealership then
            cleanupShowroomVehicles()
        end

        ::continue::
    end
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
                            if IsControlJustReleased(0, 38) then
                                openDealership(dealershipId)
                            end
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

    QBCore.Functions.TriggerCallback('rp-dealership:server:spawnPurchased', function(netId, properties, vehPlate)
        if not netId then
            QBCore.Functions.Notify('Araç spawn edilemedi.', 'error')
            return
        end
        while not NetworkDoesNetworkIdExist(netId) do Wait(10) end
        local veh = NetworkGetEntityFromNetworkId(netId)
        ensurePlate(veh, vehPlate)
        if properties then
            QBCore.Functions.SetVehicleProperties(veh, properties)
        end
        SetVehicleOnGroundProperly(veh)
        setFuel(veh, 100.0)
        TriggerEvent('vehiclekeys:client:SetOwner', vehPlate)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        SetVehicleEngineOn(veh, false, true, true)
    end, plate, model, dealershipId)
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
    local dealershipId = currentDealership
    local model = data.model
    local payType = data.payType or 'cash'
    closeDealership()
    TriggerServerEvent('rp-dealership:server:buyVehicle', dealershipId, model, payType)
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
    removeBlips()
    if hasTarget then
        for zoneName in pairs(targetZones) do
            exports['qb-target']:RemoveZone(zoneName)
        end
    end
end)

AddEventHandler('onResourceStart', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    initialized = false
    targetZones = {}
    removeBlips()
    Wait(2000)
    initDealerships()
end)
