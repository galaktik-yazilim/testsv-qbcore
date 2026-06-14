-- Sunucu tuşları: her girişte oyuncunun kayıtlı bind'lerini günceller.
-- K = kilit, L = emniyet kemeri, M = kontak, F2 = telefon

local UNBINDS = {
    { key = 'm', command = 'phone' },
    { key = 'b', command = 'toggleseatbelt' },
    { key = 'l', command = 'togglelocks' },
    { key = 'g', command = 'toggleengine' },
}

local BINDS = {
    { key = 'f2', command = 'phone' },
    { key = 'm',  command = 'toggleignition' },
    { key = 'k',  command = 'togglelocks' },
    { key = 'l',  command = 'toggleseatbelt' },
}

local function applyKeybindOverrides()
    for i = 1, #UNBINDS do
        local entry = UNBINDS[i]
        ExecuteCommand(('unbind keyboard %s %s'):format(entry.key, entry.command))
    end

    for i = 1, #BINDS do
        local entry = BINDS[i]
        ExecuteCommand(('bind keyboard %s %s'):format(entry.key, entry.command))
    end
end

local function scheduleKeybindOverrides()
    SetTimeout(2500, applyKeybindOverrides)
    SetTimeout(6000, applyKeybindOverrides)
end

AddEventHandler('onResourceStart', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    if LocalPlayer.state.isLoggedIn then
        scheduleKeybindOverrides()
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    scheduleKeybindOverrides()
end)
