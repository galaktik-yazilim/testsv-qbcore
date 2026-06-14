local Translations = {
    error = {
        minimum_store_robbery_police = "Yeterli polis yok (%{MinimumStoreRobberyPolice} gerekli)",
        not_driver = "Sürücü değilsin",
        demolish_vehicle = "Şu an araçları parçalamanıza izin verilmiyor",
        process_canceled = "İşlem iptal edildi..",
        you_broke_the_lock_pick = "Maymuncuğu kırdın",
    },
    text = {
        the_cash_register_is_empty = "Kasa boş",
        try_combination = "~g~E~w~ - Kombinasyonu dene",
        safe_opened = "Kasa açıldı",
        emptying_the_register= "Kasa boşaltılıyor..",
        safe_code = "Kasa Kodu: "
    },
    email = {
        shop_robbery = "10-31 | Dükkan Soygunu",
        someone_is_trying_to_rob_a_store = "Birisi %{street} adresindeki bir dükkânı soymaya çalışıyor (KAMERA ID: %{cameraId1})",
        storerobbery_progress = "Dükkan soygunu devam ediyor"
    },
}

if GetConvar('qb_locale', 'en') == 'tr' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
