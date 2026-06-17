-- F4: mouse imleci aç/kapa (text RP — telefon/envanterden bağımsız katman)

local cursorActive = false
local lastCloseAt = 0
local CLOSE_GUARD_MS = 400

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

local function restoreOtherNuiFocus()
    if isPhoneOpen() then
        SetNuiFocus(true, true)
        SetNuiFocusKeepInput(true)
        return true
    end

    if isInventoryOpen() then
        SetNuiFocus(true, true)
        SetNuiFocusKeepInput(false)
        return true
    end

    return false
end

local function setCursor(enabled)
    if enabled then
        if GetGameTimer() - lastCloseAt < CLOSE_GUARD_MS then
            return
        end
        cursorActive = true
        SetNuiFocus(true, true)
        SetNuiFocusKeepInput(true)
    else
        cursorActive = false
        lastCloseAt = GetGameTimer()
        SetNuiFocusKeepInput(false)
        if not restoreOtherNuiFocus() then
            SetNuiFocus(false, false)
        end
    end
end

local function canToggleCursor()
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

local function toggleCursor()
    if cursorActive then
        setCursor(false)
        return
    end

    if GetGameTimer() - lastCloseAt < CLOSE_GUARD_MS then return end
    if not canToggleCursor() then return end

    setCursor(true)
end

RegisterCommand('rpcursor', toggleCursor, false)

RegisterNUICallback('closeCursor', function(_, cb)
    if cursorActive then
        setCursor(false)
    end
    cb('ok')
end)

CreateThread(function()
    Wait(1000)
    RegisterKeyMapping('rpcursor', 'Mouse Imleci (Text RP)', 'keyboard', Config.CursorKey or 'F4')
end)

CreateThread(function()
    while true do
        if cursorActive then
            DisableControlAction(0, 1, true)
            DisableControlAction(0, 2, true)
            DisableControlAction(0, 3, true)
            DisableControlAction(0, 4, true)
            DisableControlAction(0, 5, true)
            DisableControlAction(0, 6, true)
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 106, true)

            if IsDisabledControlJustPressed(0, 200) or IsDisabledControlJustPressed(0, 322) then
                setCursor(false)
            end
            Wait(0)
        else
            Wait(250)
        end
    end
end)

exports('IsCursorMode', function()
    return cursorActive
end)

exports('SetCursorMode', function(enabled)
    if enabled then
        if not canToggleCursor() then return false end
        setCursor(true)
        return true
    end
    if cursorActive then
        setCursor(false)
    end
    return true
end)

exports('RestoreOtherNuiFocus', restoreOtherNuiFocus)
