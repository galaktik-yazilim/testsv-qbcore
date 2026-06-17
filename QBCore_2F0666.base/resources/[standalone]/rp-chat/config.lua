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
    'Detay: docs/tanitim/sunucu-kurallari.md · /komutlar',
}

-- /komutlar — oyun içi özet (tam liste: docs/tanitim/komutlar.md)
Config.CommandHelp = {
    intro = 'Los Santos · Türkçe · metrik — kısa komut özeti',
    player = {
        'T + yazı — Yakındakilere IC konuşma (~20 m)',
        '/me <mesaj> — Yakındakilere eylem mesajı gönder',
        '/ame <mesaj> — İsimsiz eylem mesajı',
        '/do <mesaj> — Ortam eylemi belirt',
        '/b <mesaj> — Yerel OOC',
        '/s <mesaj> — Fısıltı (~3 m)',
        '/w <mesaj> — Bağırma (~40 m)',
        '/911 <mesaj> — Acil çağrı (PD/EMS, görevde)',
        '/km — Araç kilometresi (km)',
        '/kurallar — Kural özeti',
        '/job — İş bilgisi · /gang — Çete bilgisi',
        '/givekeys [id] — Araç anahtarı ver',
        '/id — Sunucu ID numaran',
    },
    keys = {
        'M — Kontak · K — Kilit · L — Emniyet kemeri',
    },
    footer = 'Tam liste: docs/tanitim/komutlar.md',
    police = {
        '/cuff · /sc — Kelepçe · /escort — Taşı',
        '/jail · /unjail · /fine · /seizecash · /impound · /depot',
        '/flagplate · /unflagplate · /plateinfo · /911p',
    },
    ems = {
        '/status — Sağlık · /heal — İyileştir · /revivep — Canlandır',
        '/911e <mesaj> — EMS iç çağrı',
    },
    admin = {
        '/a <mesaj> — Admin duyurusu · /admin — Yönetici menüsü',
        '/tp · /tpm · /car · /dv — Teleport / araç',
        '/revive · /aheal — Canlandır / iyileştir (admin)',
    },
}
