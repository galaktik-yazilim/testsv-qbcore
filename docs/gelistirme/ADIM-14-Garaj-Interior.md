# Adım 14 — Garaj & Interior Çıkış

> **Durum:** ✅ Kod tamamlandı  
> Oyuncu testi: garaj park/çıkar, `/disari`

---

## Bu turda ne yaptık?

| Konu | Dosya |
|------|--------|
| **`/disari`** — iç mekândan dışarı çıkış | `rp-chat` client + server |
| `/disari` kapı bulunamazsa oyuncu konumundan dışarı tarama | `rp-chat/client/stuck.lua` |
| Garaj yakıt: `LegacyFuel` → **`qb-fuel`** | `qb-garages/config.lua` |
| Garaj park: `qb-mechanicjob` bağımlılığı kaldırıldı | `qb-garages` — `saveVehicleMods` |
| Pillbox garaj etiketi Türkçe | `qb-garages/config.lua` |

---

## Test et

- [ ] LS Cars → araç al → **Pillbox Garajı**'na park et → tekrar çıkar
- [ ] Yakıt / mod kaydı bozulmuyor
- [ ] Interior'da **`/disari`** → dış mekân
- [ ] Kapısız interior'da `/disari` yine dener (konum tabanlı)

---

## Sonraki adım

[Tur 15 — MVP cila](./ADIM-15-MVP-Cila.md) · [ADIM-04 test checklist](./ADIM-04-Test-Cila.md)
