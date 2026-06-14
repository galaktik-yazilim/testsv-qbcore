local Translations = {
    error = {
        no_money = 'Yeterli paran yok',
        too_far = 'Sosisli standından çok uzaktasın',
        no_stand = 'Sosisli standın yok',
        cust_refused = 'Müşteri reddetti!',
        no_stand_found = 'Sosisli standın bulunamadı, depoziton iade edilmeyecek!',
        no_more = 'Önünde daha fazla %{value} yok',
        deposit_notreturned = 'Sosisli standın yoktu',
        no_dogs = 'Hiç sosislin yok',
    },
    success = {
        deposit = '$%{deposit} depozito ödedin!',
        deposit_returned = '$%{deposit} depoziton iade edildi!',
        sold_hotdogs = '%{value} adet sosisli $%{value2} karşılığında satıldı',
        made_hotdog = '%{value} adet sosisli yaptın',
        made_luck_hotdog = '%{value} x %{value2} sosisli yaptın',
    },
    info = {
        command = "Standı Sil (Sadece Admin)",
        blip_name = 'Sosisli Standı',
        start_working = '[E] Çalışmaya Başla',
        start_work = 'Çalışmaya Başla',
        stop_working = '[E] Çalışmayı Bırak',
        stop_work = 'Çalışmayı Bırak',
        grab_stall = '[~g~G~s~] Standı Tut',
        drop_stall = '[~g~G~s~] Standı Bırak',
        grab = 'Standı Tut',
        prepare = 'Sosisli Hazırla',
        toggle_sell = 'Satışı Aç/Kapat',
        selling_prep = '[~g~E~s~] Sosisli hazırla [Satış: ~g~Açık~w~]',
        not_selling = '[~g~E~s~] Sosisli hazırla [Satış: ~r~Kapalı~w~]',
        sell_dogs = '[~g~7~s~] %{value} x Sosisli $%{value2} karşılığında sat / [~g~8~s~] Reddet',
        sell_dogs_target = '%{value} x Sosisli $%{value2} karşılığında sat',
        admin_removed = "Sosisli Standı Kaldırıldı",
        label_a = "Mükemmel (A)",
        label_b = "Nadir (B)",
        label_c = "Sıradan (C)"
    },
    keymapping = {
        gkey = 'Sosisli standını bırak',
    }
}

if GetConvar('qb_locale', 'en') == 'tr' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
