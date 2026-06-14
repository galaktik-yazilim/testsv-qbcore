Config = {}

-- Yakınlık mesafesi (metre) — normal konuşma, /me, /b, /do
Config.ProximityRange = 20.0

-- Renkler (RGB)
Config.Colors = {
    say      = { 255, 255, 255 },
    me       = { 194, 162, 218 }, -- mor/lila — * eylem
    do_cmd   = { 163, 195, 255 }, -- açık mavi — ** ortam
    b        = { 180, 180, 180 }, -- gri — (( OOC ))
    ooc      = { 255, 151, 133 },
    admin    = { 180, 50, 50 },
    system   = { 100, 200, 100 },
}

-- QBCore toast (Notify) → T chat yönlendirmesi
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
