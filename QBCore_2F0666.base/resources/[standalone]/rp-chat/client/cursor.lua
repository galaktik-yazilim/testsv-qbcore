-- Merkezi mouse + hareket kilidi (F4 / telefon / envanter / modul UI)
-- IsNuiFocused() KULLANMA — txAdmin (/tx), chat (T) ve diger dis NUI'leri bozar.

local isMouseVisible = false
local uiBlockDepth = 0
local lastToggleAt = 0
local TOGGLE_GUARD_MS = 300

local function isPhoneOpen()
    if GetResourceState('qb-phone') ~= 'started' then return false end
    local ok, open = pcall(function()
        return exports['qb-phone']:IsPhoneOpen()
    end)
    return ok and open
end

local function isInventoryOpen()
    return LocalPlayer.state.inv_busy == true
end

local function pushUiBlock()
    uiBlockDepth = uiBlockDepth + 1
end

local function popUiBlock()
    uiBlockDepth = math.max(0, uiBlockDepth - 1)
end

--- Hareket: modul UI veya imlec acikken kilitli. Telefon/envanter ekranda + F4 kapali = kosulabilir.
local function shouldBlockGameplay()
    if uiBlockDepth > 0 then return true end
    return isMouseVisible
end

--- F4: sadece imlec; klavye/NUI focus calinmaz (chat, /tx menu tiklanabilir kalir)
local function applyF4CursorOnly()
    SetNuiFocusKeepInput(false)
    SetNuiFocus(false, true)
end

local function clearCursorAndFocus()
    TriggerEvent('rp-mouse:releaseFocus')
    SetNuiFocusKeepInput(false)
    SetNuiFocus(false, false)
end

local function applyMouseFocus()
    if isInventoryOpen() then
        TriggerEvent('rp-mouse:applyFocus', isMouseVisible, 'inventory')
        return
    end

    if isPhoneOpen() then
        TriggerEvent('rp-mouse:applyFocus', isMouseVisible, 'phone')
        return
    end

    if isMouseVisible then
        applyF4CursorOnly()
    else
        clearCursorAndFocus()
    end
end

local function blockMouseLookControls()
    DisableControlAction(0, 1, true)
    DisableControlAction(0, 2, true)
    DisableControlAction(0, 3, true)
    DisableControlAction(0, 4, true)
    DisableControlAction(0, 5, true)
    DisableControlAction(0, 6, true)
    DisableControlAction(0, 24, true)
    DisableControlAction(0, 25, true)
    DisableControlAction(0, 106, true)
end

local function blockMovementControls()
    DisableControlAction(0, 21, true)
    DisableControlAction(0, 22, true)
    DisableControlAction(0, 30, true)
    DisableControlAction(0, 31, true)
    DisableControlAction(0, 32, true)
    DisableControlAction(0, 33, true)
    DisableControlAction(0, 34, true)
    DisableControlAction(0, 35, true)
    DisableControlAction(0, 36, true)
    DisableControlAction(0, 44, true)
    DisableControlAction(0, 63, true)
    DisableControlAction(0, 64, true)
    DisableControlAction(0, 71, true)
    DisableControlAction(0, 72, true)
    DisableControlAction(0, 75, true)
end

local function blockPhoneExtraControls()
    DisableControlAction(0, 263, true)
    DisableControlAction(0, 264, true)
    DisableControlAction(0, 257, true)
    DisableControlAction(0, 140, true)
    DisableControlAction(0, 141, true)
    DisableControlAction(0, 142, true)
    DisableControlAction(0, 143, true)
    DisableControlAction(0, 177, true)
    DisableControlAction(0, 200, true)
    DisableControlAction(0, 202, true)
    DisableControlAction(0, 322, true)
    DisableControlAction(0, 245, true)
end

local function setMouseVisible(visible)
    isMouseVisible = visible == true
    applyMouseFocus()
end

local function setMouseVisibleState(visible)
    isMouseVisible = visible == true
end

AddStateBagChangeHandler('inv_busy', nil, function(bagName, _, value)
    local myBag = ('player:%s'):format(GetPlayerServerId(PlayerId()))
    if bagName ~= myBag or value then return end
    if isPhoneOpen() then return end
    if isMouseVisible then
        setMouseVisible(false)
    end
end)

local function toggleMouseVisible()
    local now = GetGameTimer()
    if now - lastToggleAt < TOGGLE_GUARD_MS then return end
    lastToggleAt = now
    setMouseVisible(not isMouseVisible)
end

local function canEnableMouse()
    if not LocalPlayer.state.isLoggedIn then return false end
    if IsPauseMenuActive() then return false end

    local pdata = exports['qb-core']:GetCoreObject().Functions.GetPlayerData()
    if not pdata or not pdata.citizenid then return false end
    if not pdata.metadata then return true end

    if pdata.metadata.isdead or pdata.metadata.inlaststand or pdata.metadata.ishandcuffed then
        return false
    end

    return true
end

local function toggleMouseCommand()
    if isMouseVisible or isPhoneOpen() or isInventoryOpen() then
        toggleMouseVisible()
        return
    end
    if not canEnableMouse() then return end
    toggleMouseVisible()
end

RegisterCommand('rpcursor', toggleMouseCommand, false)

RegisterNUICallback('toggleMouse', function(_, cb)
    toggleMouseVisible()
    cb('ok')
end)

RegisterNUICallback('closeCursor', function(_, cb)
    setMouseVisible(false)
    cb('ok')
end)

CreateThread(function()
    Wait(1000)
    RegisterKeyMapping('rpcursor', 'Mouse Imleci (Text RP)', 'keyboard', Config.CursorKey or 'F4')
end)

CreateThread(function()
    while true do
        if shouldBlockGameplay() then
            blockMouseLookControls()
            blockMovementControls()
            if isPhoneOpen() and isMouseVisible then
                blockPhoneExtraControls()
            end

            if isMouseVisible and not isPhoneOpen() and not isInventoryOpen() then
                if IsDisabledControlJustPressed(0, 200) or IsDisabledControlJustPressed(0, 322) then
                    setMouseVisible(false)
                end
            end
            Wait(0)
        else
            Wait(250)
        end
    end
end)

exports('IsMouseVisible', function()
    return isMouseVisible
end)

exports('SetMouseVisible', function(visible)
    setMouseVisible(visible)
end)

exports('SetMouseVisibleState', function(visible)
    setMouseVisibleState(visible)
end)

exports('ToggleMouseVisible', toggleMouseVisible)

exports('IsCursorMode', function()
    return isMouseVisible
end)

exports('SetCursorMode', function(enabled)
    if enabled then
        if not canEnableMouse() and not isPhoneOpen() and not isInventoryOpen() then return false end
        setMouseVisible(true)
        return true
    end
    setMouseVisible(false)
    return true
end)

--- Modul UI acikken hareket kilidi (focus modulun kendi SetNuiFocus'unda kalir)
exports('OpenModuleUi', pushUiBlock)

exports('CloseModuleUi', popUiBlock)
