# Adım 22 — UI & Güvenlik Cilası

> **Durum:** ✅ Kod tamamlandı  
> Oyuncu testi: HUD menüsü TR, heli spotlight, ölüm logu

---

## Bu turda ne yaptık?

| Konu | Dosya |
|------|--------|
| HUD ayar menüsü tam Türkçe | `qb-hud/html/index.html` |
| qb-target / qb-menu keybind TR | `client.lua` |
| Heli spotlight: LEO + görevde | `qb-policejob/server/vehicle.lua` |
| Discord log: client yalnızca `death`, cooldown | `qb-smallresources/server/logs.lua` |
| Revive açlık/susuzluk: 30 sn cooldown | `qb-ambulancejob/server/main.lua` |
| Yatak check-in: index + mesafe doğrulama | `qb-ambulancejob/server/main.lua` |

---

## Test et

- [ ] HUD menüsü (`I` veya keybind) — tüm seçenekler Türkçe
- [ ] PD helikopter spotlight — off duty çalışmaz
- [ ] Ölüm sonrası Discord log (webhook varsa) — spam yok

---

## MVP kod durumu

Tur **01–22** tamamlandı. Kalan iş **operasyonel** → [ADIM-04-Test-Cila.md](./ADIM-04-Test-Cila.md)
