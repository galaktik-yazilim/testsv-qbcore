local Translations = {
    error = {
        you_dont_have_a_cryptostick = 'Kripto çubuğun yok',
        cryptostick_malfunctioned = 'Kripto çubuğu arızalandı'
    },
    success = {
        you_have_exchanged_your_cryptostick_for = 'Kripto çubuğunu şununla değiştirdin: %{amount} QBit'
    },
    credit = {
        there_are_amount_credited = 'Hesabına %{amount} Qbit yatırıldı!',
        you_have_qbit_purchased = '%{dataCoins} Qbit satın aldın!'
    },
    debit = {
        you_have_sold = '%{dataCoins} Qbit sattın!'
    },
    text = {
        enter_usb = '[E] - USB Tak',
        system_is_rebooting = 'Sistem yeniden başlatılıyor - %{rebootInfoPercentage} %',
        you_have_not_given_a_new_value = 'Yeni bir değer girmedin ... Mevcut değer: %{crypto}',
        this_crypto_does_not_exist = 'Bu kripto mevcut değil, mevcut kripto(lar): Qbit',
        you_have_not_provided_crypto_available_qbit = 'Kripto belirtmedin, mevcut: Qbit',
        the_qbit_has_a_value_of = 'Qbit değeri: %{crypto}',
        you_have_with_a_value_of = '%{playerPlayerDataMoneyCrypto} QBit\'in var, toplam değer: %{mypocket},-'
    }
}

if GetConvar('qb_locale', 'en') == 'tr' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
