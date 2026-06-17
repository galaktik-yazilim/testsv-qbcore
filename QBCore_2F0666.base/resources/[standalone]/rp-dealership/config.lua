Config = {}

-- Los Santos (Premium Deluxe / PDM) — IC evren ABD, fiyatlar $ USD
-- Etkileşim mesafesi metre (metrik)
Config.ShowMarker = true

-- [E] ile etkileşim (UseTarget false iken qb-target gerekmez)
Config.UseTarget = false

-- Güvenlik
Config.ServerInteractDistance = 6.0
Config.BuyCooldownSec = 3

Config.CategoryLabels = {
    compacts = 'Kompakt',
    sedans = 'Sedan',
    suvs = 'SUV',
    coupes = 'Kupe',
    muscle = 'Muscle',
    sportsclassics = 'Klasik Spor',
    sports = 'Spor',
    super = 'Süper',
    motorcycles = 'Motosiklet',
    offroad = 'Arazi',
    industrial = 'Endüstriyel',
    utility = 'Hizmet',
    vans = 'Van',
    cycles = 'Bisiklet',
    boats = 'Tekne',
    helicopters = 'Helikopter',
    planes = 'Uçak',
    service = 'Servis',
    emergency = 'Acil',
    military = 'Askeri',
    commercial = 'Ticari',
    trains = 'Tren',
    openwheel = 'Açık Teker',
}

Config.Dealerships = {
    -- Tek araç satın alma noktası (PDM girişi)
    lscars = {
        label = 'LS Cars',
        shop = 'pdm',
        garage = 'pillboxgarage',
        spawn = vector4(-31.03, -1090.38, 26.42, 340.0),
        -- Vitrin / dolu alan olursa sırayla dene (metre, Los Santos PDM)
        spawnAlternates = {
            vector4(-23.59, -1094.57, 27.05, 330.0),
            vector4(-39.65, -1101.52, 26.42, 70.0),
        },
        interact = vector4(-45.67, -1098.34, 26.42, 70.0),
        marker = {
            type = 1,
            scale = vector3(1.2, 1.2, 1.0),
            color = { r = 0, g = 200, b = 80, a = 210 },
        },
        blip = {
            enabled = true,
            label = 'LS Cars',
            sprite = 326,
            color = 2,
            scale = 0.85,
            shortRange = true,
        },
        interactDistance = 2.5,
        drawText = '[E] LS Cars',
        cleanupRadius = 90.0,
    },
}
