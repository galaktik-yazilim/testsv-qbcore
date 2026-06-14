local Translations = {
    progress = {
        ['snowballs'] = 'Kartopları toplanıyor...',
    },
    notify = {
        ['failed'] = 'Başarısız',
        ['canceled'] = 'İptal edildi',
        ['vlocked'] = 'Araç kilitlendi',
        ['notowned'] = 'Bu eşyaya sahip değilsiniz!',
        ['missitem'] = 'Bu eşyaya sahip değilsiniz!',
        ['nonb'] = 'Yakında kimse yok!',
        ['noaccess'] = 'Erişilemez',
        ['nosell'] = 'Bu eşyayı satamazsınız.',
        ['itemexist'] = 'Bu eşya mevcut değil.',
        ['notencash'] = 'Yeterli nakit paranız yok.',
        ['noitem'] = 'Doğru eşyalara sahip değilsiniz.',
        ['gsitem'] = 'Kendinize eşya veremezsiniz!',
        ['tftgitem'] = 'Eşya vermek için çok uzaktasınız!',
        ['infound'] = 'Vermeye çalıştığınız eşya bulunamadı!',
        ['iifound'] = 'Yanlış eşya bulundu, tekrar deneyin!',
        ['gitemrec'] = 'Aldınız: ',
        ['gitemfrom'] = ' - ',
        ['gitemyg'] = 'Verdiniz: ',
        ['gitinvfull'] = 'Diğer oyuncunun envanteri dolu!',
        ['giymif'] = 'Envanteriniz dolu!',
        ['gitydhei'] = 'Yeterli miktarda eşyanız yok',
        ['gitydhitt'] = 'Transfer etmek için yeterli eşyanız yok',
        ['navt'] = 'Geçerli bir tür değil.',
        ['anfoc'] = 'Argümanlar doğru doldurulmadı.',
        ['yhg'] = 'Verdiniz: ',
        ['cgitem'] = 'Eşya verilemiyor!',
        ['idne'] = 'Eşya mevcut değil',
        ['pdne'] = 'Oyuncu çevrimiçi değil',
        ['nogunbag'] = 'Aynı anda silah ve çanta tutamazsınız!',
        ['hasbag'] = 'Zaten bir çanta tutuyorsunuz, önce onu bırakın!',
        ['invinuse'] = 'Bu envanter şu anda kullanımda',
        ['notenoughstock'] = 'Stoktaki miktardan fazla satın alamazsınız',
        ['canthold'] = 'Bu eşyayı taşıyamazsınız',
    },
    inf_mapping = {
        ['opn_inv'] = 'Envanteri Aç',
        ['tog_slots'] = 'Kısayol slotlarını aç/kapat',
        ['use_item'] = 'Slottaki eşyayı kullan: ',
    },
    menu = {
        ['vending'] = 'Otomat',
        ['bin'] = 'Çöp Konteynerini Aç',
        ['craft'] = 'Üret',
        ['o_bag'] = 'Çantayı Aç',
        ['p_bag'] = 'Çantayı al',
    },
    interaction = {
        ['craft'] = '~g~E~w~ - Üret',
        ['drop_bag'] = 'Çantayı bırakmak için [G] tuşuna basın',
    },
}

if GetConvar('qb_locale', 'en') == 'tr' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
