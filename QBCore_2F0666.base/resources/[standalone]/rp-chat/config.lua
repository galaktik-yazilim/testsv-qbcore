Config = {}

-- Mesafe katmanları (metre)
Config.ProximityRange = 20.0  -- normal konuşma, /me, /b, /do
Config.WhisperRange = 3.0     -- /s fısıltı
Config.ShoutRange = 40.0      -- /w bağırma

-- Güvenlik & performans
Config.MaxMessageLength = 256
Config.CommandCooldownMs = 1500
Config.VehicleActionCooldownMs = 800

-- Renkler (RGB)
Config.Colors = {
    say      = { 255, 255, 255 },
    me       = { 194, 162, 218 },
    do_cmd   = { 163, 195, 255 },
    whisper  = { 200, 200, 220 },
    shout    = { 255, 220, 180 },
    b        = { 180, 180, 180 },
    ooc      = { 255, 151, 133 },
    admin    = { 180, 50, 50 },
    system   = { 100, 200, 100 },
}

-- QBCore toast (Notify) → chat yönlendirmesi
Config.NotifyToChat = true

Config.NotifyColors = {
    error   = { 255, 110, 110 },
    success = { 120, 220, 140 },
    warning = { 255, 195, 100 },
    primary = { 163, 195, 255 },
    info    = { 163, 195, 255 },
}

Config.NotifyPrefixes = {
    error   = '!',
    success = '✓',
    warning = '!',
    primary = '»',
    info    = '»',
}
