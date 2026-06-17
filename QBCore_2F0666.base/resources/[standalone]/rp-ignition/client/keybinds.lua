-- Sunucu tuşları — fivem.cfg'den bağımsız, her oyuncuda aynı.
-- F2 telefon | M kontak | K kilit | L kemer
-- Eski bind'ler (M→phone, L→togglelocks) boş komutlara gider; asıl iş burada.

local KEYS = {
    { control = 289, command = 'openphone',       cooldown = 400, inVehicle = false }, -- F2
    { control = 244, command = 'toggleignition',    cooldown = 500, inVehicle = true  }, -- M
    { control = 311, command = 'rp_vehiclelock',  cooldown = 450, inVehicle = false }, -- K
    { control = 182, command = 'rp_seatbelt',     cooldown = 450, inVehicle = true  }, -- L
}

local KEYS_TO_CLEAR = { 'k', 'l', 'm', 'b', 'g', 'f2', 'F2' }
local COMMANDS_TO_CLEAR = {
    'phone', 'openphone',
    'togglelocks', 'rp_vehiclelock',
    'toggleseatbelt', 'rp_seatbelt',
    'toggleignition', 'toggleengine',
}

local lastUsed = {}

local function stripLegacyBinds()
    for i = 1, #KEYS_TO_CLEAR do
        local key = KEYS_TO_CLEAR[i]
        ExecuteCommand(('unbind keyboard %s'):format(key))
        for j = 1, #COMMANDS_TO_CLEAR do
            ExecuteCommand(('unbind keyboard %s %s'):format(key, COMMANDS_TO_CLEAR[j]))
        end
    end
end

local function scheduleStripLegacyBinds()
    stripLegacyBinds()
    SetTimeout(500, stripLegacyBinds)
    SetTimeout(2000, stripLegacyBinds)
    SetTimeout(5000, stripLegacyBinds)
end

local function handleKeyPress(entry)
    if entry.inVehicle and not IsPedInAnyVehicle(PlayerPedId(), false) then
        return
    end
    ExecuteCommand(entry.command)
end

CreateThread(function()
    while true do
        if LocalPlayer.state.isLoggedIn and not IsPauseMenuActive() then
            local now = GetGameTimer()

            for i = 1, #KEYS do
                local entry = KEYS[i]
                if IsControlJustPressed(0, entry.control) then
                    if not lastUsed[i] or now - lastUsed[i] > entry.cooldown then
                        lastUsed[i] = now
                        handleKeyPress(entry)
                    end
                end
            end

            Wait(5)
        else
            Wait(500)
        end
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    scheduleStripLegacyBinds()
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() and LocalPlayer.state.isLoggedIn then
        scheduleStripLegacyBinds()
    end
end)
