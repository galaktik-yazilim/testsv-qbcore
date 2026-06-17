# Adım 17–20 — Kapanış Öncesi Son Paket

> **Durum:** ✅ Kod tamamlandı (Tur 17–20)  
> **Genel ilerleme:** hâlâ **58%** — oyun içi test (+12) senin tarafında

MVP kod geliştirmesi bu turda **kapanış öncesi son paket** olarak tamamlandı. Kalan işler operasyonel: test → beta → açılış → teknik borç.

---

## Tur 17 — Güvenlik sertleştirme

| Konu | Dosya |
|------|--------|
| Araç anahtarı: sahiplik / sürücü koltuğu doğrulama | `qb-vehiclekeys/server.lua` |
| Uzaktan kilit: mesafe kontrolü | `qb-vehiclekeys/server.lua` |
| PD impound: LEO + on duty + değer sınırı | `qb-policejob/server/vehicle.lua` |
| Garaj state/track/outside: plaka sahiplik | `qb-garages/server.lua` |
| Kapı kilidi: `sentSource` spoof engeli | `qb-doorlock/server.lua` |
| EMS metadata: armor/death clamp | `qb-ambulancejob/server/main.lua` |
| EMS stash: görevde EMS kontrolü | `qb-ambulancejob/server/main.lua` |

Detay: [GUVENLIK-DENETIMI.md](./GUVENLIK-DENETIMI.md)

---

## Tur 18 — Yakıt standardı

| Konu | Dosya |
|------|--------|
| Yalnızca `qb-fuel` (LegacyFuel fallback kaldırıldı) | `qb-hud`, `qb-garages`, `rp-dealership`, `qb-smallresources` |

---

## Tur 19 — Türkçe arayüz

| Konu | Dosya |
|------|--------|
| Banka NUI Türkçe | `qb-banking/html/index.html` |
| HUD ayar menüsü Türkçe | `qb-hud/html/index.html` |
| EMS doktor çağrısı metinleri | `qb-ambulancejob` |
| Sürücü belgesi etiketi | `qb-multicharacter/server.lua` |
| Keybind açıklamaları | `qb-hud`, `qb-smallresources` |
| Galeri kategori | `rp-dealership/config.lua` |

---

## Tur 20 — Doğrulama & dokümantasyon

| Konu | Dosya |
|------|--------|
| Preflight script | `scripts/preflight-server.ps1` |
| Verify script (ensure listesi) | `scripts/verify-server-cfg.ps1` |
| Güvenlik denetimi genişletme | `GUVENLIK-DENETIMI.md` |

**Preflight çalıştır:**
```powershell
.\scripts\preflight-server.ps1
```

---

## Kod geliştirmesi bitti — sırada operasyon

| Sıra | Adım | Puan | Dosya |
|------|------|------|-------|
| 1 | Oyun içi test | +12 → **70%** | [ADIM-04](./ADIM-04-Test-Cila.md) |
| 2 | Kapalı beta | +18 → **88%** | [ADIM-05](./ADIM-05-Kapali-Beta.md) |
| 3 | Açılış | +10 → **98%** | [ADIM-07](./ADIM-07-Acilis.md) |
| 4 | Teknik borç | +2 → **100%** | [ADIM-08](./ADIM-08-Teknik-Borc.md) |

P4+ (konut, telefon, injury): [ADIM-06](./ADIM-06-P4-Plan.md) — açılış **sonrası**.

---

## Test checklist (Tur 17–20)

- [ ] Preflight OK
- [ ] Galeri → araç al → anahtar çalışıyor (sahiplik)
- [ ] Banka / ATM arayüzü Türkçe
- [ ] EMS araç + doktor çağrısı Türkçe
- [ ] HUD menüsü Türkçe (`/menu` veya keybind)
