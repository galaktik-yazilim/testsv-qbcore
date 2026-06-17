Config = {}

Config.SyncIntervalMs = 10000
Config.MinSpeed = 1.0
Config.MaxDeltaPerTick = 50.0

-- Güvenlik: client sync sınırları
Config.MinSyncIntervalSec = 8
Config.MaxSyncsPerMinute = 10

Config.IgnoreClasses = {
    [13] = true,
    [14] = true,
    [15] = true,
    [16] = true,
}
