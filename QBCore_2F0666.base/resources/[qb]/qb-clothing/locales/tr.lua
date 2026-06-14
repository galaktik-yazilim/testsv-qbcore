local Translations = {
    store = {
        barber = "Berber",
        surgeon = "Plastik Cerrah",
        clothing = "Giyim Mağazası",
        outfitchanger = "Kıyafet Değiştirici"
    },

    outfits = {
        roomOutfits = "Hazır Kıyafetler",
        myOutfits = "Kıyafetlerim",
        character = "Giyim",
        accessoires = "Aksesuarlar"
    },

    menu = {
        hair = "Saç",
        character = "Giyim",
        accessoires = "Aksesuarlar",
        features = "Özellikler"
    },

    ui = {
        select = "Seç",
        delete = "Sil",
        select_outfit = "Kıyafet Seç",
        player_model = "Oyuncu Modeli",
        model = "Model",
        mother = "Anne",
        father = "Baba",
        texture = "Doku",
        type = "Tür",
        item = "Eşya",
        skin_color = "Ten Rengi",
        parent_mixer = "Ebeveyn Karışımı",
        shape_mix = "Şekil Karışımı",
        skin_mix = "Ten Karışımı",
        arms = "Kollar",
        undershirt = "Atlet/Kemerler",
        color = "Renk",
        jacket = "Ceketler/Üstler",
        vests = "Yelekler",
        decals = "Çıkartmalar",
        acessory = "Boyun Aksesuarları",
        bags = "Çantalar",
        pants = "Pantolon",
        shoes = "Ayakkabılar",
        eye_color = "Göz Rengi",
        moles = "Benler/Çiller",
        opacity = "Opaklık",
        nose_width = "Burun Genişliği",
        width = "Genişlik",
        nose_peak_height = "Burun Ucu Yüksekliği",
        height = "Yükseklik",
        nose_peak_length = "Burun Ucu Uzunluğu",
        length = "Uzunluk",
        nose_bone_height = "Burun Kemiği Yüksekliği",
        nose_peak_lowering = "Burun Ucu Alçaltma",
        lowering = "Alçaltma",
        nose_bone_twist = "Burun Kemiği Bükülmesi",
        twist = "Bükülme",
        eyebrow_height = "Kaş Yüksekliği",
        eyebrow_depth = "Kaş Derinliği",
        depth = "Derinlik",
        cheeks_height = "Yanak Yüksekliği",
        cheeks_width = "Yanak Genişliği",
        cheeks_depth = "Yanak Derinliği",
        eyes_opening = "Göz Açıklığı",
        opening = "Açıklık",
        lips_thickness = "Dudak Kalınlığı",
        thickness = "Kalınlık",
        jaw_bone_width = "Çene Kemiği Genişliği",
        jaw_bone_length = "Çene Kemiği Uzunluğu",
        chin_height = "Çene Kemiği Yüksekliği",
        chin_width = "Çene Kemiği Genişliği",
        butt_chin  ="Gamze",
        size = "Boyut",
        neck_thickness = "Boyun Kalınlığı",
        ageing = "Yaşlanma",
        hair = "Saç",
        eyebrow = "Kaşlar",
        facial_hair = "Sakal",
        lipstick = "Ruj",
        blush = "Allık",
        makeup = "Makyaj",
        mask = "Maskeler",
        hat = "Şapkalar",
        glasses = "Gözlükler",
        ear_accessories = "Kulak Aksesuarları",
        watch = "Saatler",
        bracelet = "Bileklikler",
        btn_confirm = "Onayla",
        btn_cancel = "İptal",
        btn_saveOutfit = "Kıyafeti Kaydet",
        outfit_name = "Kıyafet Adı"
    },

    notify = {
        error_bracelet = "Ayak bilekliğinizi çıkaramazsınız...",
        info_deleteOutfit = "%{outfit} kıyafetinizi sildiniz!"
    }
}

if GetConvar('qb_locale', 'en') == 'tr' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
