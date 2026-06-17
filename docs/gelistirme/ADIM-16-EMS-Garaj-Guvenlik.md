# Adım 16 — EMS Yakıt & Garaj Güvenliği

> **Durum:** ✅ Kod tamamlandı  
> Oyuncu testi: EMS araç spawn, garaj park/çıkar, çekilmiş araç

---

## Bu turda ne yaptık?

| Konu | Dosya |
|------|--------|
| **qb-ambulancejob** EMS araç/heli yakıtı → `qb-fuel` | `config.lua`, `client/job.lua` |
| **qb-smallresources** cruise yakıt kontrolü — çift kontrol düzeltmesi | `client/cruise.lua` |
| Garaj spawn — plaka sahiplik doğrulaması | `qb-garages/server.lua` |
| Garaj stats/mods/depot — plaka sanitize + sahiplik + değer sınırı | `qb-garages/server.lua` |
| `syncGarage` — yalnızca `type = house` birleştirme (tam config overwrite engeli) | `qb-garages/server.lua` |
| Garaj TR locale — TIR / çekilmiş araç etiketleri | `qb-garages/locales/tr.lua` |

---

## Test et

- [ ] EMS on duty → meslek aracı çıkar → yakıt dolu, hata yok
- [ ] Garaj park / çıkar — başkasının plakasıyla exploit yok (normal akış)
- [ ] Çekilmiş araçlar (depot) ödeme + çıkış
- [ ] Garaj menüsünde **E - Garaj** / **E - Çekilmiş araçlar** Türkçe

---

## Sonraki adım

[ADIM-04-Test-Cila.md](./ADIM-04-Test-Cila.md) · PD/EMS bölümü ile birlikte doğrula
