local Translations = {
    text = {
        weazle_overlay = "Weazle Katmanı ~INPUT_PICKUP~ \nFilm Katmanı: ~INPUT_INTERACTION_MENU~",
        vehicle = "Weazel News Araçları",
        close_menu = "⬅ Menüyü Kapat",
        heli = "Weazel News Helikopterleri",
        store_vehicle = "~g~E~w~ - Aracı Garaja Koy",
        vehicles = "~g~E~w~ - Araçlar",
        store_helicopters = "~g~E~w~ - Helikopterleri Garaja Koy",
        helicopters = "~g~E~w~ - Helikopterler",
        enter = "~g~E~w~ - Gir",
        go_outside = "~g~E~w~ - Dışarı çık",
        breaking_news = "SON DAKİKA",
        title_breaking_news = "07:00 / Bugün Weazel News Özel Haberi",
        bottom_breaking_news = "En son haberleri canlı olarak size ulaştırıyoruz"
    }
}

if GetConvar('qb_locale', 'en') == 'tr' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
