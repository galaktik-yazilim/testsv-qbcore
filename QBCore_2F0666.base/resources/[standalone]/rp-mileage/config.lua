Config = {}

-- Veritabanında mil olarak saklanır (player_vehicles.drivingdistance)
Config.SyncIntervalMs = 30000
Config.MinSpeed = 1.0
Config.MaxDeltaPerTick = 50.0

-- Bisiklet vb. hariç (GTA vehicle class)
Config.IgnoreClasses = {
    [13] = true, -- cycles
    [14] = true, -- boats (ayrı sistem gerekirse)
    [15] = true, -- helicopters
    [16] = true, -- planes
}
