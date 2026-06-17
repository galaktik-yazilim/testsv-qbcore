# Adım 09 — Beta Öncesi Cila

> **Durum:** ✅ Kod tamamlandı  
> **Ne zaman:** Adım 04 oyun içi test ile birlikte doğrula

Test öncesi son kod cilası — beta ve açılışa hazırlık.

---

## Bu turda ne yaptık?

| Konu | Dosya |
|------|--------|
| `rp-ignition` yanlış `qb-phone` bağımlılığı kaldırıldı | `fxmanifest.lua` |
| Loading ekranı — Los Santos, text RP, voice/telefon yok | `qb-loading/html/app.js` |
| İlk giriş karşılama chat mesajları | `rp-chat` → `Config.WelcomeMessages` |
| Whitelist aç/kapa script | `scripts/toggle-whitelist.ps1` |

---

## Test et

- [ ] Restart — `rp-ignition` qb-phone hatası yok
- [ ] Loading slaytları Los Santos / text RP metni gösteriyor
- [ ] Karakter yüklendikten sonra chat'te otomatik hoş geldin / tuş mesajı **yok**
- [ ] `scripts/toggle-whitelist.ps1` — test modunda `0` kalsın; beta öncesi `-Set 1`

---

## Sonraki adım

[ADIM-04-Test-Cila.md](./ADIM-04-Test-Cila.md) checklist → [ADIM-05-Kapali-Beta.md](./ADIM-05-Kapali-Beta.md)
