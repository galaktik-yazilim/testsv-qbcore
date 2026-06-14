local Translations = {
    error = {
        negative = 'Negatif miktarda satmaya mı çalışıyorsun?',
        no_melt = 'Eritecek bir şey vermedin...',
        no_items = 'Yeterli eşya yok',
        inventory_full = 'Envanter tüm eşyaları almak için çok dolu. Bir dahaki sefere envanterinin boş olduğundan emin ol. Kaybedilen eşyalar: %{value}'
    },
    success = {
        sold = '%{value} x %{value2} eşyasını $%{value3} karşılığında sattın',
        items_received = '%{value} x %{value2} aldın',
    },
    info = {
        title = 'Rehin Dükkanı',
        subject = 'Eşyalar Eritiliyor',
        message = 'Eşyalarını eritmeyi tamamladık. İstediğin zaman gelip alabilirsin.',
        open_pawn = 'Rehin Dükkanını Aç',
        sell = 'Eşya Sat',
        sell_pawn = 'Rehin Dükkanına Eşya Sat',
        melt = 'Eşya Erit',
        melt_pawn = 'Eritme Dükkanını Aç',
        melt_pickup = 'Eritilmiş Eşyaları Al',
        pawn_closed = 'Rehin dükkanı kapalı. %{value}:00 - %{value2}:00 arası tekrar gel',
        sell_items = 'Satış Fiyatı $%{value}',
        back = '⬅ Geri Dön',
        melt_item = '%{value} Erit',
        max = 'Maksimum Miktar %{value}',
        submit = 'Erit',
        melt_wait = 'Bana %{value} dakika ver, eşyalarını eriteyim',
    }
}

if GetConvar('qb_locale', 'en') == 'tr' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
