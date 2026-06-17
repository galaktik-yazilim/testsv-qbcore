# Adım 24 — PD/EMS Etkileşim Sertleştirme

> **Durum:** ✅ Kod tamamlandı  
> Son geliştirme turu — ardından toplu oyun içi test

---

## Bu turda ne yaptık?

| Konu | Dosya |
|------|--------|
| PD arama/ceza/hapish/eli koyma: görevde zorunlu | `qb-policejob/server/interactions.lua` |
| Ceza tutarı / hapis süresi clamp | `interactions.lua` |
| Parmak izi + takip cihazı: LEO guard | `qb-policejob/server/main.lua` |
| Respawn: yalnızca ölü/laststand + hospital index | `qb-ambulancejob/server/main.lua` |
| İlk yardım / tüketim: envanter doğrulama | `qb-ambulancejob/server/main.lua` |
| Tackle keybind TR | `qb-smallresources/client/tackle.lua` |
| Envanter drop etiketi TR | `qb-inventory/html/app.js` |

---

## Test et (Tur 24)

- [ ] PD off duty → arama/ceza/hapish çalışmaz
- [ ] Ölü değilken respawn exploit yok
- [ ] Envantersiz bandaj/ilk yardım tüketimi yok
- [ ] Parmak izi off duty kapalı

---

## Sonraki adım

Toplu test → [OYUN-ICI-TEST-HIZLI.md](./OYUN-ICI-TEST-HIZLI.md)
