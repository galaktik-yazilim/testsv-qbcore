# Test Öncesi — Final Kontrol Listesi

> **Tur 01–25 tamamlandı.** Birkaç saat sonra test edeceksen bu sayfayı takip et.

---

## 1. Otomatik kontrol (2 dk)

```powershell
cd c:\txData
.\scripts\setup-dev-env.ps1
```

Çıktı **TEST ONCESI KONTROL OK** olmalı. Hata varsa düzelt, tekrar çalıştır.

Alternatif (sadece cfg):
```powershell
.\scripts\preflight-server.ps1
```

---

## 2. Restart

- txAdmin → **Restart** (veya sunucuyu durdur / başlat)
- Konsolda resource hatası olmamalı
- `oxmysql` bağlantısı OK

---

## 3. Test hesapları (önerilen)

| # | Rol | Amaç |
|---|-----|------|
| 1 | Sivil | Giriş, chat, galeri, garaj |
| 2 | PD (opsiyonel) | On/off duty, kelepçe |
| 3 | EMS (opsiyonel) | On/off duty, revive |
| 4 | Admin | `/revive`, `/a` |

Tek hesapla da smoke test yapılabilir; PD/EMS için 2. karakter veya admin job ataması gerekir.

---

## 4. Whitelist

**Varsayilan: kapali** (`qb_whitelist 0` — server.cfg'de ayarli). Test icin ek islem gerekmez.

Production veya kapali beta oncesi (ACE otomatik):

```powershell
.\scripts\enable-beta-mode.ps1
```

Detay: [ADIM-05-Kapali-Beta.md](./ADIM-05-Kapali-Beta.md)

---

## 5. Oyun içi test

Detaylı checklist: [OYUN-ICI-TEST-HIZLI.md](./OYUN-ICI-TEST-HIZLI.md)

Minimum smoke (5 dk):
1. Giriş → Legion spawn
2. `/komutlar`, `/kurallar`
3. LS Cars → araç al → garaj
4. M / K / L / `/km`
5. F8 hata yok

---

## 6. Test sonrası

[TEST-SONRASI.md](./TEST-SONRASI.md) — ilerleme güncelleme, beta adımları

---

## Hızlı referans

| Dosya | Ne için |
|-------|---------|
| [komutlar.md](../tanitim/komutlar.md) | Tüm komutlar |
| [GUVENLIK-DENETIMI.md](./GUVENLIK-DENETIMI.md) | Güvenlik özeti |
| [DURUM.md](./DURUM.md) | Tur durumu |
| [TODO.md](../TODO.md) | Operasyon checklist |
