local Translations = {
    error = {
        finish_work = "Önce tüm işlerini bitir",
        vehicle_not_correct = "Bu doğru araç değil",
        failed = "Başarısız oldun",
        not_towing_vehicle = "Çekici aracında olmalısın",
        too_far_away = "Çok uzaktasın",
        no_work_done = "Henüz hiç iş yapmadın",
        no_deposit = "$%{value} depozito gerekli",
    },
    success = {
        paid_with_cash = "$%{value} depozito nakit ödendi",
        paid_with_bank = "$%{value} depozito bankadan ödendi",
        refund_to_cash = "$%{value} depozito nakit iade edildi",
        you_earned = "$%{value} kazandın",
    },
    menu = {
        header = "Mevcut Kamyonlar",
        close_menu = "⬅ Menüyü Kapat",
    },
    mission = {
        delivered_vehicle = "Bir aracı teslim ettin",
        get_new_vehicle = "Yeni bir araç alınabilir",
        towing_vehicle = "Araç çekiliyor...",
        goto_depot = "Aracı Hayes Deposuna götür",
        vehicle_towed = "Araç çekildi",
        untowing_vehicle = "Aracı indir",
        vehicle_takenoff = "Araç indirildi",
    },
    info = {
        tow = "Düz kasanın arkasına bir araç yerleştir",
        toggle_npc = "NPC işini aç/kapat",
        skick = "İstismar girişimi tespit edildi",
    },
    label = {
        payslip = "Maaş Bordrosu",
        vehicle = "Araç",
        npcz = "NPC Bölgesi",
    }
}

if GetConvar('qb_locale', 'en') == 'tr' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
