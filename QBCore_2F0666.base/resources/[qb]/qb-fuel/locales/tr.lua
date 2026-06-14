local Translations = {
    progress = {
        refueling = 'Yakıt dolduruluyor...',
    },
    success = {
        refueled = 'Araca yakıt dolduruldu',
    },
    error = {
        no_money = 'Yeterli paran yok',
        no_vehicle = 'Yakında araç bulunamadı',
        no_vehicles = 'Yakında araç yok',
        no_jerrycan = 'Benzin bidonun yok',
        vehicle_full = 'Aracın deposu zaten dolu',
        no_fuel_can = 'Benzin bidonunda yakıt yok',
        no_nozzle = 'Yakında hortum takılı araç yok',
        too_far = 'Pompadan çok uzaktasın, hortum geri alındı',
        wrong_side = 'Aracın deposu diğer tarafta',
    },
    target = {
        put_fuel = 'Yakıt doldur',
        get_nozzle = 'Hortumu al',
        buy_jerrycan = 'Benzin Bidonu Al $%{price}',
        refill_jerrycan = 'Benzin Bidonu Doldur $%{price}',
        refill_fuel = 'Yakıt Doldur',
        nozzle_put = 'Hortumu Tak',
        nozzle_remove = 'Hortumu Çıkar',
        return_nozzle = 'Hortumu Geri Ver',
    }
}

if GetConvar('qb_locale', 'en') == 'tr' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
