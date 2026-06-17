local QBCore = exports['qb-core']:GetCoreObject()

local function notify(text, nType)
    TriggerEvent('rp-chat:client:notify', text, nType or 'error')
end

local function fadeTeleport(coords, heading)
    local ped = PlayerPedId()
    DoScreenFadeOut(250)
    while not IsScreenFadedOut() do Wait(0) end

    FreezeEntityPosition(ped, true)
    SetEntityCoords(ped, coords.x, coords.y, coords.z, false, false, false, false)
    if heading then
        SetEntityHeading(ped, heading)
    end
    RequestCollisionAtCoord(coords.x, coords.y, coords.z)
    Wait(200)
    FreezeEntityPosition(ped, false)

    DoScreenFadeIn(250)
end

local function getInteriorCenter(interiorId)
    local ix, iy, iz = GetInteriorPosition(interiorId)
    return vector3(ix, iy, iz)
end

local function vecFromTable(v)
    if not v then return nil end
    return vector3(v.x or v[1], v.y or v[2], v.z or v[3])
end

local function computeExitFromDoor(doorCoords, interiorId)
    local center = getInteriorCenter(interiorId)
    local dir = doorCoords - center
    if #dir < 0.05 then
        dir = vector3(0.0, 1.0, 0.0)
    else
        dir = dir / #dir
    end
    local exitPos = doorCoords + (dir * (Config.StuckRecovery.FdoorExitOffset or 1.35))
    local heading = GetHeadingFromVector_2d(dir.x, dir.y)
    return exitPos, heading
end

local function findDoorlockExit(interiorId, playerCoords, maxDist)
    if GetResourceState('qb-doorlock') ~= 'started' then return nil end

    local doorList = exports['qb-doorlock']:GetDoorList()
    if not doorList then return nil end

    local bestCoords, bestDist = nil, maxDist + 1.0
    local fallbackCoords, fallbackDist = nil, 25.0

    for _, door in pairs(doorList) do
        local dc = vecFromTable(door.textCoords) or vecFromTable(door.objCoords)
        if dc then
            local dist = #(playerCoords - dc)
            if dist < bestDist then
                local doorInterior = GetInteriorAtCoords(dc.x, dc.y, dc.z)
                if doorInterior == interiorId then
                    bestDist = dist
                    bestCoords = dc
                elseif dist < fallbackDist then
                    fallbackDist = dist
                    fallbackCoords = dc
                end
            end
        end
    end

    return bestCoords or fallbackCoords
end

local function isDoorLikeObject(entity, interiorId)
    if not DoesEntityExist(entity) then return false end
    if GetEntityType(entity) ~= 3 then return false end

    local oc = GetEntityCoords(entity)
    local objInterior = GetInteriorFromEntity(entity)
    if objInterior == 0 then
        objInterior = GetInteriorAtCoords(oc.x, oc.y, oc.z)
    end
    if objInterior ~= interiorId then return false end

    local ok, name = pcall(GetEntityArchetypeName, entity)
    if ok and type(name) == 'string' and name:lower():find('door', 1, true) then
        return true
    end

    local model = GetEntityModel(entity)
    local regOk, registered = pcall(IsDoorRegisteredWithSystem, model)
    return regOk and registered
end

local function findObjectExit(interiorId, playerCoords, maxDist)
    local bestEntity, bestDist = nil, maxDist + 1.0

    for _, obj in ipairs(GetGamePool('CObject')) do
        if isDoorLikeObject(obj, interiorId) then
            local oc = GetEntityCoords(obj)
            local dist = #(playerCoords - oc)
            if dist < bestDist then
                bestDist = dist
                bestEntity = obj
            end
        end
    end

    if bestEntity then
        return GetEntityCoords(bestEntity)
    end
end

local function tryFdoor()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        notify('Araçtayken /fdoor kullanamazsın.', 'warning')
        return false
    end

    local interiorId = GetInteriorFromEntity(ped)
    if interiorId == 0 then
        notify('Bir bina içinde değilsin.', 'warning')
        return false
    end

    local playerCoords = GetEntityCoords(ped)
    local maxDist = Config.StuckRecovery.FdoorMaxSearch or 60.0

    local doorCoords = findDoorlockExit(interiorId, playerCoords, maxDist)
    if not doorCoords then
        doorCoords = findObjectExit(interiorId, playerCoords, maxDist)
    end

    if not doorCoords then
        notify('Çıkış kapısı bulunamadı. /dimsifirla dene veya çık-gir.', 'error')
        return false
    end

    local exitPos, heading = computeExitFromDoor(doorCoords, interiorId)
    fadeTeleport(exitPos, heading)
    notify('Çıkış kapısına ışınlandın — dışarı çıkmak için kapıyı kullan.', 'success')
    return true
end

RegisterNetEvent('rp-chat:client:fdoor', function()
    tryFdoor()
end)

RegisterNetEvent('rp-chat:client:dimResetDone', function(bucketBefore)
    DoScreenFadeOut(200)
    while not IsScreenFadedOut() do Wait(0) end
    Wait(150)
    DoScreenFadeIn(300)

    if bucketBefore and bucketBefore ~= 0 then
        notify('Ana boyuta (dim 0) alındın.', 'success')
    else
        notify('Konum metadata temizlendi.', 'success')
    end
end)
