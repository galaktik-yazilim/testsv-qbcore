local QBCore = exports['qb-core']:GetCoreObject()

local function FallbackToastNotify(text, texttype, length, icon)
    local message = {
        action = 'notify',
        type = texttype or 'primary',
        length = length or 5000,
    }

    if type(text) == 'table' then
        message.text = text.text or 'Placeholder'
        message.caption = text.caption or 'Placeholder'
    else
        message.text = text
    end

    if icon then
        message.icon = icon
    end

    SendNUIMessage(message)
end

local function StripFormatting(text)
    if type(text) ~= 'string' then return tostring(text) end
    return text:gsub('[~<].-[>~]', '')
end

local function ResolveNotifyText(text)
    if type(text) == 'table' then
        local body = text.text or text.caption
        local extra = text.caption and text.text and text.caption ~= text.text and text.caption or nil
        if extra and body then
            return StripFormatting(extra .. ': ' .. body)
        end
        return StripFormatting(body or 'Bildirim')
    end
    return StripFormatting(text)
end

local function SendChatLine(line, color)
    local payload = {
        color = color,
        multiline = true,
        args = { line, '' },
    }

    TriggerEvent('chat:addMessage', payload)

    if GetResourceState('chat') == 'started' then
        pcall(function()
            exports['chat']:addMessage(payload)
        end)
    end
end

function NotifyToChat(text, texttype, length, icon)
    if not Config.NotifyToChat then
        return FallbackToastNotify(text, texttype, length, icon)
    end

    local notifyType = texttype or 'primary'
    local message = ResolveNotifyText(text)
    local prefix = Config.NotifyPrefixes[notifyType] or Config.NotifyPrefixes.primary or '»'
    local color = Config.NotifyColors[notifyType] or Config.Colors.system
    local line = prefix ~= '' and (prefix .. ' ' .. message) or message

    SendChatLine(line, color)
end

local function ApplyNotifyOverride()
    QBCore = exports['qb-core']:GetCoreObject()
    QBCore.Functions.Notify = NotifyToChat
end

ApplyNotifyOverride()

AddEventHandler('onResourceStart', function(resource)
    if resource == 'qb-core' or resource == GetCurrentResourceName() then
        Wait(500)
        ApplyNotifyOverride()
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(500)
    ApplyNotifyOverride()
end)

RegisterNetEvent('QBCore:Client:UpdateObject', function()
    Wait(0)
    ApplyNotifyOverride()
end)

RegisterNetEvent('rp-chat:client:notify', function(text, texttype)
    NotifyToChat(text, texttype)
end)

exports('Notify', NotifyToChat)
