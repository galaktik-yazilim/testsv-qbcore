# Admin Yönetimi (txAdmin)

> Moderasyon prosedürü — hard RP sunucusu.

---

## Araçlar

| Araç | Kullanım |
|------|----------|
| txAdmin | Kick, ban, warn, whitelist, restart |
| Oyun içi | `/logout` (admin), qb-adminmenu |
| vMenu (opsiyonel) | Araç spawn, teleport, hava — sadece admin/dev; kurulum: [vmenu-kurulum.md](../gelistirme/vmenu-kurulum.md) |
| Discord | Uyarı kaydı, başvuru onayı |

---

## Uyarı → ceza akışı

| Seviye | txAdmin | Oyun |
|--------|---------|------|
| 1. uyarı | Warn (txAdmin log) | Chat uyarısı |
| 2. ihlal | Kick | — |
| 3. ihlal / RDM | Ban 1–7 gün | — |
| Hile / exploit | Kalıcı ban | — |

Her işlemde: oyuncu adı, license, sebep, kanıt (screenshot/mesaj log).

---

## txAdmin whitelist

1. txAdmin panel → Players → Whitelist
2. Identifier ekle (license önerilir)
3. `qb_whitelist 0` ise yalnızca txAdmin kontrol eder

---

## QBCore ACE whitelist (otomatik)

Beta / production icin:

```powershell
# scripts/whitelist-licenses.txt dosyasina license ekle
.\scripts\enable-beta-mode.ps1
```

Yeni oyuncu: `whitelist-licenses.txt` satir ekle → `.\scripts\sync-whitelist-ace.ps1` → restart.

Test modu (herkes girer): `.\scripts\enable-dev-mode.ps1`

Detay: [ADIM-26-Otomasyon-Whitelist.md](../gelistirme/ADIM-26-Otomasyon-Whitelist.md)

---

## Karakter silme (CK)

Oyuncu **kendisi silemez** (`EnableDeleteButton = false`).

Admin (god):
```
/deletechar CITIZENID
```

CK öncesi: Discord onay, RP gerekçesi, log.

---

## PD/EMS atama

```
/setjob [id] police [grade]
/setjob [id] ambulance [grade]
```

Hard RP: faction başvurusu + whitelist zorunlu.

---

## Sunucu restart

- txAdmin → Scheduled Restart (günlük 06:00 önerilir)
- Restart öncesi: `#duyurular` 5 dk uyarı
- Yedek: `scripts/backup-data.ps1` *(henüz kurulmadıysa manuel dump — bkz. [TEKNIK-BORC.md](../TEKNIK-BORC.md))*

---

## Acil durum

| Durum | Aksiyon |
|-------|---------|
| Exploit / dupe | Sunucu kapat, yedek al, log incele |
| Mass RDM | txAdmin ban wave |
| DB sorunu | Son `_backups/` dump'ı geri yükle |

Detay: [sunucu-kurallari.md](./sunucu-kurallari.md)
