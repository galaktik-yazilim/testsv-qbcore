local Translations = {
    afk = {
        will_kick = 'AFK\'sınız ve ',
        time_seconds = ' saniye içinde atılacaksınız!',
        time_minutes = ' dakika içinde atılacaksınız!',
        kick_message = 'AFK olduğunuz için atıldınız'
    },
    wash = {
        in_progress = "Araç yıkanıyor...",
        wash_vehicle = "[E] Aracı Yıka",
        wash_vehicle_target = "Aracı Yıka",
        dirty = "Araç kirli değil",
        cancel = "Yıkama iptal edildi..."
    },
    consumables = {
        eat_progress = "Yemek yeniyor...",
        drink_progress = "İçecek içiliyor...",
        liqour_progress = "Alkol içiliyor...",
        coke_progress = "Hızlı bir nefes...",
        crack_progress = "Crack içiliyor...",
        ecstasy_progress = "Hap alınıyor",
        healing_progress = "İyileştiriliyor",
        meth_progress = "Metamfetamin içiliyor",
        joint_progress = "Joint yakılıyor...",
        use_parachute_progress = "Paraşüt giyiliyor...",
        pack_parachute_progress = "Paraşüt paketleniyor...",
        no_parachute = "Paraşütünüz yok!",
        armor_full = "Üzerinizde zaten yeterli zırh var!",
        armor_empty = "Yelek giymiyorsunuz...",
        armor_progress = "Vücut zırhı giyiliyor...",
        heavy_armor_progress = "Ağır vücut zırhı giyiliyor...",
        remove_armor_progress = "Vücut zırhı çıkarılıyor...",
        canceled = "İptal edildi..."
    },
    cruise = {
        unavailable = "Hız sabitleyici kullanılamıyor",
        activated = "Hız sabitleyici etkinleştirildi",
        deactivated = "Hız sabitleyici devre dışı bırakıldı",
        not_Enough_Fuel = "Yeterli yakıt yok"
    },
    editor = {
        started = "Kayıt başlatıldı!",
        save = "Kayıt kaydedildi!",
        delete = "Kayıt silindi!",
        editor = "Görüşmek üzere!"
    },
    firework = {
        place_progress = "Havai fişek yerleştiriliyor...",
        canceled = "İptal edildi...",
        time_left = "Havai fişek fırlatma: "
    },
    seatbelt = {
        use_harness_progress = "Yarış kemeri takılıyor",
        remove_harness_progress = "Yarış kemeri çıkarılıyor",
        no_car = "Bir aracın içinde değilsiniz.",
        cannot_exit = "Emniyet kemeriniz takılıyken araçtan inemezsiniz",
    },
    teleport = {
        teleport_default = 'Asansörü Kullan'
    },
    pushcar = {
        stop_push = "[E] İtmeyi Durdur",
        notDamaged = "Araç itmek için yeterince hasarlı değil!",
    }
}

if GetConvar('qb_locale', 'en') == 'tr' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
