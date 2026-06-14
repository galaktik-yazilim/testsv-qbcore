local Translations = {
    menus = {
        header = 'Üretim Menüsü',
        pickupworkBench = 'Çalışma Tezgahını Al',
        entercraftAmount = 'Üretim Miktarını Gir:',
    },
    notifications = {
        pickupBench = 'Çalışma tezgahını aldın.',
        invalidAmount = 'Geçersiz Miktar Girildi',
        invalidInput = 'Geçersiz Giriş Girildi',
        notenoughMaterials = "Yeterli malzemen yok!",
        craftingCancelled = 'Üretimi iptal ettin',
        tablePlace = 'Üretim masan yerleştirildi',
        craftMessage = 'Bir %s ürettin',
        xpGain = '%s alanında %d XP kazandın',
    }
}

if GetConvar('qb_locale', 'en') == 'tr' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
