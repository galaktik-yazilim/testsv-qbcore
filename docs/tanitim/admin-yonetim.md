# Admin Yönetimi (txAdmin)

> Moderasyon prosedürü — hard RP sunucusu.

---

## Araçlar

| Araç | Kullanım |
|------|----------|
| txAdmin | Kick, ban, warn, whitelist, restart |
| Oyun içi | `/logout` (admin), qb-adminmenu |
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

## QBCore ACE whitelist

`setr qb_whitelist 1` ise:

```
add_principal identifier.license:XXX group.whitelisted
```

Kaldırma: satırı sil + `refresh` veya cfg restart.

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
- Yedek: `scripts/backup-data.ps1`

---

## Acil durum

| Durum | Aksiyon |
|-------|---------|
| Exploit / dupe | Sunucu kapat, yedek al, log incele |
| Mass RDM | txAdmin ban wave |
| DB sorunu | Son `_backups/` dump'ı geri yükle |

Detay: [sunucu-kurallari.md](./sunucu-kurallari.md)
