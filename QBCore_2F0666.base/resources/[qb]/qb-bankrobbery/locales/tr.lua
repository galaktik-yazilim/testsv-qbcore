local Translations = {
    success = {
        success_message = "Başarılı",
        fuses_are_blown = "Sigortalar atıldı",
        door_has_opened = "Kapı açıldı"
    },
    error = {
        cancel_message = "İptal edildi",
        safe_too_strong = "Kasa kilidi çok güçlü görünüyor...",
        missing_item = "Bir eşya eksik...",
        bank_already_open = "Banka zaten açık...",
        minimum_police_required = "En az %{police} polis gerekli",
        security_lock_active = "Güvenlik kilidi aktif, kapı şu an açılamıyor",
        wrong_type = "%{receiver}, '%{argument}' argümanı için doğru türü almadı\nalınan tür: %{receivedType}\nalınan değer: %{receivedValue}\nbeklenen tür: %{expected}",
        fuses_already_blown = "Sigortalar zaten atılmış...",
        event_trigger_wrong = "%{event}%{extraInfo} bazı koşullar sağlanmadan tetiklendi, kaynak: %{source}",
        missing_ignition_source = "Ateşleme kaynağı eksik"
    },
    general = {
        breaking_open_safe = "Kasa açılıyor...",
        connecting_hacking_device = "Hack cihazı bağlanıyor...",
        fleeca_robbery_alert = "Fleeca bankası soygun girişimi",
        paleto_robbery_alert = "Blain County Savings bankası soygun girişimi",
        pacific_robbery_alert = "Pacific Standard Bank soygun girişimi",
        break_safe_open_option_target = "Kasayı Aç",
        break_safe_open_option_drawtext = "[E] Kasayı aç",
        validating_bankcard = "Kart doğrulanıyor...",
        thermite_detonating_in_seconds = "Termit %{time} saniye içinde patlayacak",
        bank_robbery_police_call = "10-90: Banka Soygunu"
    }
}

if GetConvar('qb_locale', 'en') == 'tr' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
