local Translations = {
    ui = {
        last_location = "Son Konum",
        confirm = "Onayla",
        where_would_you_like_to_start = "Nereden başlamak istersin?",
    }
}

if GetConvar('qb_locale', 'en') == 'tr' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
