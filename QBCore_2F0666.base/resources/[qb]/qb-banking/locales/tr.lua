local Translations = {
    success = {
        withdraw = 'Para çekme başarılı',
        deposit = 'Para yatırma başarılı',
        transfer = 'Transfer başarılı',
        account = 'Hesap oluşturuldu',
        rename = 'Hesap yeniden adlandırıldı',
        delete = 'Hesap silindi',
        userAdd = 'Kullanıcı eklendi',
        userRemove = 'Kullanıcı kaldırıldı',
        card = 'Kart oluşturuldu',
        give = '$%s nakit verildi',
        receive = '$%s nakit alındı',
    },
    error = {
        error = 'Bir hata oluştu',
        access = 'Yetkiniz yok',
        account = 'Hesap bulunamadı',
        accounts = 'Maksimum hesap sayısına ulaşıldı',
        user = 'Kullanıcı zaten ekli',
        noUser = 'Kullanıcı bulunamadı',
        money = 'Yeterli para yok',
        pin = 'Geçersiz PIN',
        card = 'Banka kartı bulunamadı',
        amount = 'Geçersiz tutar',
        toofar = 'Çok uzaktasınız',
    },
    progress = {
        atm = 'ATM\'ye erişiliyor',
    }
}

if GetConvar('qb_locale', 'en') == 'tr' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
