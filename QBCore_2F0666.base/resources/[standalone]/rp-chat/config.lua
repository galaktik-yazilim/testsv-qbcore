Config = {}

-- Mesafe katmanları (metre) — Los Santos evreni, metrik birim
Config.ProximityRange = 20.0  -- normal konuşma, /me, /b, /do
Config.WhisperRange = 3.0     -- /s fısıltı
Config.ShoutRange = 40.0      -- /w bağırma

-- Güvenlik & performans
Config.MaxMessageLength = 256
Config.CommandCooldownMs = 1500
Config.VehicleActionCooldownMs = 800

-- /911 acil çağrı (text dispatch — panel yok)
Config.Emergency911Jobs = { 'police', 'ambulance' }
Config.Emergency911RequireOnDuty = true
Config.Emergency911CooldownMs = 60000

-- Renkler (RGB)
Config.Colors = {
    say      = { 255, 255, 255 },
    me       = { 194, 162, 218 },
    ame      = { 170, 140, 200 },
    do_cmd   = { 163, 195, 255 },
    whisper  = { 200, 200, 220 },
    shout    = { 255, 220, 180 },
    b        = { 180, 180, 180 },
    ooc      = { 255, 151, 133 },
    admin    = { 180, 50, 50 },
    system   = { 100, 200, 100 },
    emergency = { 255, 90, 90 },
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

-- /kurallar — oyuncuya chat'te gösterilen özet (detay: docs/tanitim/sunucu-kurallari.md)
Config.RulesMessages = {
    'Los Santos (Amerika) evreni — arayüz Türkçe, mesafe/km metrik (m, km).',
    'Voice yok; chat: T, /me, /ame, /do, /s, /w, /b. OOC: /b.',
    'Fear RP + NLRP. 1 karakter. Araç: M kontak, K kilit, L kemer, /km.',
    'Detay: docs/tanitim/sunucu-kurallari.md · docs/tanitim/evren-ve-dil.md',
}
