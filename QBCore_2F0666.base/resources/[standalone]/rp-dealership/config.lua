Config = {}

-- Her zaman yeşil marker göster (giriş noktasında)
Config.ShowMarker = true

-- qb-target bölgesi
Config.UseTarget = true

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
    -- Haritadaki "Premium Deluxe Motorsport" blip'inin tam önü (PDM girişi)
    pdm = {
        label = 'Premium Deluxe Motorsport',
        shop = 'pdm',
        garage = 'pillboxgarage',
        spawn = vector4(-56.79, -1109.85, 26.43, 71.5),
        interact = vector4(-45.67, -1098.34, 26.42, 70.0),
        marker = {
            type = 1,
            scale = vector3(1.0, 1.0, 0.9),
            color = { r = 0, g = 200, b = 80, a = 200 },
        },
        blip = {
            enabled = false,
        },
        interactDistance = 2.5,
        drawText = '[E] Galeriyi Aç',
    },
}
