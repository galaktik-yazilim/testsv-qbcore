Config = {}

Config.SyncIntervalMs = 10000
Config.MinSpeed = 1.0             -- m/s (~3.6 km/s) — altında km sayacı artmaz
Config.MaxDeltaPerTick = 50.0     -- metre/tick üst sınır (exploit)

-- Güvenlik: client sync sınırları
Config.MinSyncIntervalSec = 8
Config.MaxSyncsPerMinute = 10

Config.IgnoreClasses = {
    [13] = true,
    [14] = true,
    [15] = true,
    [16] = true,
}

-- Ekranda km; DB iç değer mil (GTA/QBCore uyumu) — Los Santos, metrik gösterim
Config.DisplayMetricKm = true
