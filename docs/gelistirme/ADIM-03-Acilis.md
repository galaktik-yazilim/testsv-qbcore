# Adım 03 — Açılış Hazırlığı

> **Durum:** ✅ Tamamlandı (kod + dokümantasyon)

---

## Bu adımda ne yaptık?

| Konu | Dosya / değişiklik |
|------|---------------------|
| Whitelist (QBCore ACE) | `setr qb_whitelist`, `group.whitelisted` + `join` ACE |
| Discord link | `sets qb_discord` → qb-core config |
| MySQL güvenli kullanıcı | `scripts/setup-mysql.sql` *(kurulum: [TEKNIK-BORC.md](../TEKNIK-BORC.md))* |
| Günlük yedek | `scripts/backup-data.ps1` *(kurulum: [TEKNIK-BORC.md](../TEKNIK-BORC.md))* |
| Slot / performans | `sv_maxclients 32` (example), performans notları |
| Sunucu listesi metni | hostname, tags, projectDesc |
| PD/EMS hard RP config | `qb-policejob`, `qb-ambulancejob` |
| Discord + başvuru rehberi | `docs/tanitim/discord-ve-basvuru.md` |
| Admin prosedürü | `docs/tanitim/admin-yonetim.md` |

---

## Whitelist açma (kapalı beta → açılış)

### 1. server.cfg

```
setr qb_whitelist 1
```

### 2. Onaylı oyuncu ekle

```
add_principal identifier.license:ROCKSTAR_LICENSE group.whitelisted
```

Adminler zaten `group.admin join allow` ile girebilir.

### 3. txAdmin alternatifi

txAdmin → Settings → Whitelist kullanırsanız `qb_whitelist 0` bırakıp yalnızca txAdmin whitelist yönetebilirsiniz.

---

## MySQL güvenli kurulum

> **Teknik borç** — detay ve checklist: [TEKNIK-BORC.md](../TEKNIK-BORC.md). Şimdilik root yeterli.

```powershell
# Şifreyi scripts/setup-mysql.sql içinde değiştirin
mysql -u root -p < scripts/setup-mysql.sql
```

`server.cfg`:
```
set mysql_connection_string "mysql://fivem:SIFRE@localhost/QBCore_2F0666?charset=utf8mb4"
```

Yedek için:
```powershell
copy scripts\mysql.env.example scripts\mysql.env
# mysql.env doldurun
```

---

## Günlük yedek

> **Teknik borç** — [TEKNIK-BORC.md](../TEKNIK-BORC.md)

```powershell
.\scripts\backup-data.ps1
# Otomatik (Yönetici PS):
.\scripts\install-daily-backup.ps1
```

---

## Performans

- `sv_maxclients 32` — MVP/kapalı beta için yeterli
- Voice kapalı (~2 resource tasarrufu)
- Explicit ensure (~24 resource daha az arcade yük)
- Detay: [PERFORMANS-NOTLARI.md](./PERFORMANS-NOTLARI.md)

---

## Açılış checklist

**Önce sunucu:**
- [ ] MySQL bağlantısı çalışıyor (root ile devam edebilirsin)
- [ ] Restart → oyuna gir, temel RP testi
- [ ] Kapalı beta: whitelist + [KAPALI-BETA-CHECKLIST.md](./KAPALI-BETA-CHECKLIST.md)

**Topluluk (acele yok):**
- [ ] Discord + kurallar pin
- [ ] `qb_discord` ve hostname güncel

**Teknik borç (en son):** [TEKNIK-BORC.md](../TEKNIK-BORC.md) — MySQL `fivem` kullanıcısı, yedek, `resmon`

---

## Tüm adımlar

| Adım | Konu | Dosya |
|------|------|-------|
| 01 | MVP temel (karakter, ekonomi, cfg) | [ADIM-01-MVP-Temel.md](./ADIM-01-MVP-Temel.md) |
| 02 | Voice kaldır, /911, kurallar | [ADIM-02-Kapali-Beta.md](./ADIM-02-Kapali-Beta.md) |
| 03 | Whitelist, açılış | Bu dosya |
