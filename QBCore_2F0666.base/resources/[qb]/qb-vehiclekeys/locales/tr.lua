local Translations = {
    notify = {
        ydhk = 'Bu aracın anahtarlarına sahip değilsiniz.',
        nonear = 'Anahtarları verecek yakında kimse yok',
        vlock = 'Araç kilitlendi!',
        vunlock = 'Araç kilidi açıldı!',
        vlockpick = 'Kapı kilidini açmayı başardınız!',
        fvlockpick = 'Anahtarları bulamadınız ve sinirlendiniz.',
        vgkeys = 'Anahtarları teslim ettiniz.',
        vgetkeys = 'Aracın anahtarlarını aldınız!',
        fpid = 'Oyuncu ID ve plaka argümanlarını doldurun',
        cjackfail = 'Araç gaspı başarısız!',
        vehclose = 'Yakında araç yok!',
    },
    progress = {
        takekeys = 'Cesetten anahtarlar alınıyor...',
        hskeys = 'Araç anahtarları aranıyor...',
        acjack = 'Araç gaspı deneniyor...',
    },
    info = {
        skeys = '~g~[H]~w~ - Anahtarları Ara',
        tlock = 'Araç Kilitlerini Aç/Kapat',
        palert = 'Araç hırsızlığı devam ediyor. Tür: ',
        engine = 'Motoru Aç/Kapat',
    },
    addcom = {
        givekeys = 'Anahtarları birine ver. ID yoksa en yakındaki kişiye veya araçtaki herkese verir.',
        givekeys_id = 'id',
        givekeys_id_help = 'Oyuncu ID',
        addkeys = 'Birine araç anahtarı ekler.',
        addkeys_id = 'id',
        addkeys_id_help = 'Oyuncu ID',
        addkeys_plate = 'plate',
        addkeys_plate_help = 'Plaka',
        rkeys = 'Birinden araç anahtarlarını kaldırır.',
        rkeys_id = 'id',
        rkeys_id_help = 'Oyuncu ID',
        rkeys_plate = 'plate',
        rkeys_plate_help = 'Plaka',
    }

}

if GetConvar('qb_locale', 'en') == 'tr' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
