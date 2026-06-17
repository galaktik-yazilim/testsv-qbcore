# Performans Notları

> Text-based hard RP sunucusu için referans değerleri.  
> **Öncelik:** teknik borç — ölçüm sunucu dolunca; bkz. [TEKNIK-BORC.md](../TEKNIK-BORC.md)

---

## Resource sayısı

| Dönem | Aktif resource | Not |
|-------|----------------|-----|
| Eski (ensure [qb]) | ~56+ | Arcade + voice |
| Şimdi (explicit) | ~30 | Voice + arcade kapalı |

---

## Kaldırılan yükler

| Kaldırılan | Kazanç |
|------------|--------|
| `pma-voice` | Native audio, proximity thread |
| `qb-radio` | NUI + radio state |
| 20+ arcade qb script | Idle + event yükü |
| `loadHouseData` (houses kapalı) | Giriş başına SQL |

---

## Slot önerisi

| Aşama | sv_maxclients | OneSync |
|-------|---------------|---------|
| Kapalı beta | 16–32 | default veya on |
| Açılış | 32–48 | test sonrası |
| Büyüme | 48+ | infinity değerlendir |

Mevcut config: **32 slot** (example + yerel server.cfg).

---

## resmon ölçümü

Boş sunucuda F8:

```
resmon 1
```

Kaydedin:

| Resource | Hedef (idle) |
|----------|----------------|
| qb-core | < 0.05 ms |
| oxmysql | < 0.05 ms |
| qb-hud | < 0.10 ms |
| rp-chat | < 0.02 ms |
| Toplam | Oyuncu yokken düşük olmalı |

10 oyuncu ile tekrar ölçün — spike varsa resource adını not edin.

---

## Client optimizasyon (sunucu tarafı)

- NPC/traffic density = 0 (`qb-smallresources`) ✅
- Gereksiz map paketi yok ✅
- NUI: phone kapalı, minimal HUD ✅

---

## MySQL

> Kurulum maddeleri teknik borç: [TEKNIK-BORC.md](../TEKNIK-BORC.md)

- Ayrı `fivem` kullanıcısı — `scripts/setup-mysql.sql`
- Index: QBCore default `citizenid`, `plate` ✅
- Günlük dump — `scripts/install-daily-backup.ps1`

---

## Ne zaman scale?

1. `resmon` sürekli > 0.50 ms tek resource
2. 32 slot dolu + queue
3. Tick rate düşüşü / rubberband

Önce resource budama, sonra donanım, en son slot artırımı.
