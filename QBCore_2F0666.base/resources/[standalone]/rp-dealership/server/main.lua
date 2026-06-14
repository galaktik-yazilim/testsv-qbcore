local QBCore = exports['qb-core']:GetCoreObject()
local sharedVehicles = exports['qb-core']:GetShared('Vehicles')

local StringCharset = {}
local NumberCharset = {}
for i = 48, 57 do NumberCharset[#NumberCharset + 1] = string.char(i) end
for i = 65, 90 do StringCharset[#StringCharset + 1] = string.char(i) end
for i = 97, 122 do StringCharset[#StringCharset + 1] = string.char(i) end

local function RandomStr(length)
    if length <= 0 then return '' end
    return RandomStr(length - 1) .. StringCharset[math.random(1, #StringCharset)]
end

local function RandomInt(length)
    if length <= 0 then return '' end
    return RandomInt(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
end

local function GeneratePlate()
    local plate = RandomInt(1) .. RandomStr(2) .. RandomInt(3) .. RandomStr(2)
    local result = MySQL.scalar.await('SELECT plate FROM player_vehicles WHERE plate = ?', { plate })
    if result then
        return GeneratePlate()
    end
    return plate:upper()
end

local function vehicleInShop(vehShop, shopId)
    if type(vehShop) == 'string' then
        return vehShop == shopId
    end
    if type(vehShop) == 'table' then
        for i = 1, #vehShop do
            if vehShop[i] == shopId then return true end
        end
    end
    return false
end

local function getCategoryLabel(category)
    return Config.CategoryLabels[category] or (category:sub(1, 1):upper() .. category:sub(2))
end

local function buildCatalog(shopId)
    local vehicles = {}
    local categories = {}
    local brands = {}

    for model, data in pairs(sharedVehicles) do
        if data.shop and vehicleInShop(data.shop, shopId) and data.price and data.price > 0 then
            local category = data.category or 'other'
            vehicles[#vehicles + 1] = {
                model = model,
                name = data.name or model,
                brand = data.brand or 'Unknown',
                price = data.price,
                category = category,
                categoryLabel = getCategoryLabel(category),
            }
            categories[category] = getCategoryLabel(category)
            brands[data.brand or 'Unknown'] = true
        end
    end

    table.sort(vehicles, function(a, b)
        if a.brand == b.brand then
            if a.name == b.name then return a.price < b.price end
            return a.name < b.name
        end
        return a.brand < b.brand
    end)

    local categoryList = {}
    for id, label in pairs(categories) do
        categoryList[#categoryList + 1] = { id = id, label = label }
    end
    table.sort(categoryList, function(a, b) return a.label < b.label end)

    local brandList = {}
    for brand in pairs(brands) do
        brandList[#brandList + 1] = brand
    end
    table.sort(brandList)

    return vehicles, categoryList, brandList
end

QBCore.Functions.CreateCallback('rp-dealership:server:getCatalog', function(source, cb, dealershipId)
    local dealership = Config.Dealerships[dealershipId]
    if not dealership then return cb(false) end

    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return cb(false) end

    local vehicles, categories, brands = buildCatalog(dealership.shop)
    cb({
        label = dealership.label,
        vehicles = vehicles,
        categories = categories,
        brands = brands,
        cash = Player.PlayerData.money.cash or 0,
        bank = Player.PlayerData.money.bank or 0,
    })
end)

RegisterNetEvent('rp-dealership:server:buyVehicle', function(dealershipId, model, payType)
    local src = source
    local dealership = Config.Dealerships[dealershipId]
    if not dealership or type(model) ~= 'string' then return end

    payType = payType == 'bank' and 'bank' or 'cash'
    local vehData = sharedVehicles[model]
    if not vehData or not vehData.shop or not vehicleInShop(vehData.shop, dealership.shop) then
        TriggerClientEvent('QBCore:Notify', src, 'Bu araç bu galeride satılmıyor.', 'error')
        return
    end

    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local price = tonumber(vehData.price) or 0
    if price <= 0 then
        TriggerClientEvent('QBCore:Notify', src, 'Geçersiz fiyat.', 'error')
        return
    end

    local balance = Player.PlayerData.money[payType] or 0
    if balance < price then
        TriggerClientEvent('QBCore:Notify', src, 'Yeterli paranız yok.', 'error')
        return
    end

    local plate = GeneratePlate()
    MySQL.insert.await('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage, state, drivingdistance) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)', {
        Player.PlayerData.license,
        Player.PlayerData.citizenid,
        model,
        joaat(model),
        '{}',
        plate,
        dealership.garage,
        0,
        0,
    })

    Player.Functions.RemoveMoney(payType, price, 'rp-dealership-purchase')
    TriggerClientEvent('QBCore:Notify', src, ('%s satın alındı! Plaka: %s'):format(vehData.name or model, plate), 'success')
    TriggerClientEvent('rp-dealership:client:spawnPurchased', src, dealershipId, model, plate)
end)
