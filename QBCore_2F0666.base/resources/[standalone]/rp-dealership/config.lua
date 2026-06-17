Config = {}

-- Her zaman yeşil marker göster (giriş noktasında)
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
    openwheel = 'Open Wheel',
}

Config.Dealerships = {
    -- Tek araç satın alma noktası (PDM girişi)
    lscars = {
        label = 'LS Cars',
        shop = 'pdm',
        garage = 'pillboxgarage',
        spawn = vector4(-56.79, -1109.85, 26.43, 71.5),
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
