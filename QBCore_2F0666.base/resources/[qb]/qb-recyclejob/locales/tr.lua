local Translations = {
    success = {
        you_have_been_clocked_in = "Mesaiye başladın",
        sold = '%{amount} adet %{item} eşyasını $%{price} karşılığında sattın',
    },
    text = {
        point_enter_warehouse = "[E] Depoya Gir",
        enter_warehouse= "Depoya Gir",
        exit_warehouse= "Depodan Çık",
        point_exit_warehouse = "[E] Depodan Çık",
        toggle_duty = "Mesaiyi Aç/Kapat",
        point_toggle_duty = "[E] Mesaiyi Aç/Kapat",
        hand_in_package = "Paketi Teslim Et",
        point_hand_in_package = "[E] Paketi Teslim Et",
        get_package = "Paketi Al",
        point_get_package = "[E] Paketi Al",
        picking_up_the_package = "Paket alınıyor",
        unpacking_the_package = "Paket açılıyor",
        clock_in = "Mesaiye başladın",
        clock_out = "Mesaiden çıktın",
        sell_materials = "Malzeme Sat",
        point_sell_materials = "[E] Malzeme Sat",
        price = "Fiyat: $%{price}",
        amount = "Miktar",
        sell = "Sat",
    },
    error = {
        you_have_clocked_out = "Mesaiden çıktın",
        nothing_to_sell = "Satacak bir şeyin yok",
        out_of_stock = "%{item} stokta yok",
        too_far_to_sell = "Satmak için çok uzaktasın",
    },
}

if GetConvar('qb_locale', 'en') == 'tr' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
