# Adım 10 — Giriş & PD Cila

> **Durum:** ✅ Kod tamamlandı  
> Önceki fix: [Adım 09](./ADIM-09-Beta-Oncesi-Cila.md) + loading/apartments callback

---

## Bu turda ne yaptık?

| Konu | Dosya |
|------|--------|
| Yeni karakter: `openCharMenu()` tekrar açılıyordu → kaldırıldı | `qb-multicharacter/client.lua` |
| Yeni karakter: houses/apartments guard | `closeNUIdefault` |
| `/fine` telefon faturası → phone kapalıyken chat bildirimi | `qb-policejob/server/commands.lua` |
| Spawn noktası etiketleri Türkçe | `qb-spawn/config.lua` |
| PD alert phone guard | `qb-policejob/server/main.lua`, `commands.lua` |
| PD TR locale (`/fine`, ceza bildirimleri) | `qb-policejob/locales/tr.lua` |
| EMS fatura maili → phone yokken notify | `qb-ambulancejob/client/main.lua` |
| server.cfg doğrulama script | `scripts/verify-server-cfg.ps1` |

---

## Test et

- [ ] **Yeni karakter** oluştur → kıyafet ekranı açılır (karakter menüsü geri gelmez)
- [ ] **Mevcut karakter** giriş → spawn OK
- [ ] PD `/fine` — parası yok, phone yok → hata chat'te (crash yok)
- [ ] `.\scripts\verify-server-cfg.ps1` — qb-phone ensure yok

---

## qb-phone uyarısı

Konsolda `Started resource qb-phone` görüyorsan:

```powershell
.\scripts\verify-server-cfg.ps1
```

txAdmin ek cfg veya elle eklenmiş `ensure qb-phone` satırını kaldır.

---

## Sonraki adım

[ADIM-04-Test-Cila.md](./ADIM-04-Test-Cila.md) → beta
