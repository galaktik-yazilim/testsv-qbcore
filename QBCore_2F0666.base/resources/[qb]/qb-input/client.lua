local Config = {
    Style = 'default'
}

local properties = nil

local function setModuleUiFocus(enabled)
    if GetResourceState('rp-chat') == 'started' then
        if enabled then
            pcall(function() exports['rp-chat']:OpenModuleUi() end)
        else
            pcall(function() exports['rp-chat']:CloseModuleUi() end)
        end
    end
    SetNuiFocusKeepInput(false)
    SetNuiFocus(enabled, enabled)
end

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then
        return
    end
    Wait(1000)
    SendNUIMessage({
        action = 'SET_STYLE',
        data = Config.Style
    })
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    SendNUIMessage({
        action = 'SET_STYLE',
        data = Config.Style
    })
end)

RegisterNUICallback('buttonSubmit', function(data, cb)
    setModuleUiFocus(false)
    properties:resolve(data.data)
    properties = nil
    cb('ok')
end)

RegisterNUICallback('closeMenu', function(_, cb)
    setModuleUiFocus(false)
    properties:resolve(nil)
    properties = nil
    cb('ok')
end)

local function ShowInput(data)
    Wait(150)
    if not data then return end
    if properties then return end

    properties = promise.new()

    setModuleUiFocus(true)
    SendNUIMessage({
        action = 'OPEN_MENU',
        data = data
    })

    return Citizen.Await(properties)
end

exports('ShowInput', ShowInput)
