local Translations = {
    error = {
        process_canceled = "İşlem iptal edildi",
        plant_has_died = "Bitki öldü. Bitkiyi kaldırmak için ~r~ E ~w~ tuşuna bas.",
        cant_place_here = "Buraya yerleştirilemez",
        not_safe_here = "Burada güvenli değil, evini dene",
        not_need_nutrition = "Bitkinin besine ihtiyacı yok",
        this_plant_no_longer_exists = "Bu bitki artık mevcut değil mi?",
        house_not_found = "Ev bulunamadı",
        you_dont_have_enough_resealable_bags = "Yeterli kilitli poşetin yok",
    },
    text = {
        sort = 'Tür:',
        harvest_plant = 'Bitkiyi hasat etmek için ~g~ E ~w~ tuşuna bas.',
        nutrition = "Besin:",
        health = "Sağlık:",
        progress = "İlerleme:",
        harvesting_plant = "Bitki hasat ediliyor",
        planting = "Ekiliyor",
        feeding_plant = "Bitki besleniyor",
        the_plant_has_been_harvested = "Bitki hasat edildi",
        removing_the_plant = "Bitki kaldırılıyor",
        stage = "Mevcut Aşama:",
        highestStage = "Hasat Aşaması:",
    },
}

if GetConvar('qb_locale', 'en') == 'tr' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
