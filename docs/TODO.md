# Aktif TODO Listesi

> Kod tarafı (Adım 01–03) **bitti**. Kalan iş: sunucuyu aç, içeri gir, test et.

Detay: [gelistirme/README.md](./gelistirme/README.md) · [CHANGELOG.md](../CHANGELOG.md)

---

## Durum özeti

```
Adım 01 MVP temel          ✅
Adım 02 Kapalı beta prep   ✅
Adım 03 Açılış hazırlığı   ✅
P4+ (konut, telefon…)      — açılış sonrası
```

---

## Şimdi yap — sunucuyu aç

- [ ] `server.cfg`: `sv_licenseKey`, `mysql_connection_string`, `steam_webApiKey` dolu mu?
- [ ] MySQL çalışıyor, QBCore veritabanı import edildi mi?
- [ ] Sunucu **restart** → txAdmin / konsolda hata yok mu?
- [ ] Oyuna gir: karakter olu, chat (`/me`, `/s`), araç/galeri dene
- [ ] İsteğe bağlı: `sets qb_discord` gerçek invite linki

**Kapalı beta** (herkese açmayacaksan):
- [ ] `setr qb_whitelist 1` veya txAdmin whitelist
- [ ] Beta oyunculara `group.whitelisted` ACE
- [ ] [KAPALI-BETA-CHECKLIST.md](./gelistirme/KAPALI-BETA-CHECKLIST.md)

**Discord** (oyuncu toplamadan önce şart değil):
- [ ] Sunucu kur + [discord-ve-basvuru.md](./tanitim/discord-ve-basvuru.md)

---

## Sonra yap — açılış sonrası (şimdilik önemsiz)

MySQL ayrı kullanıcı, günlük yedek, `resmon` kaydı — sunucu ayakta ve oyuncu varken anlamlı. Scriptler hazır, acele yok.

- [ ] `scripts/setup-mysql.sql` → `fivem` kullanıcısı (root yerine)
- [ ] `scripts/backup-data.ps1` / günlük görev
- [ ] F8 `resmon 1` → [PERFORMANS-NOTLARI.md](./gelistirme/PERFORMANS-NOTLARI.md)

---

## Tamamlanan geliştirmeler (arşiv)

<details>
<summary>Tıkla — kod & dokümantasyon</summary>

- [x] Explicit server.cfg, voice kapalı, event güvenliği
- [x] MVP: 1 slot, chat, /911, ekonomi, PD/EMS config
- [x] Whitelist ACE + Discord convar altyapısı
- [x] Yedek/MySQL scriptleri (kullanım: sonra)
- [x] `docs/tanitim/` + `docs/gelistirme/`

</details>

---

## P4+ — Açılış sonrası

Konut, telefon, taşımacılık — [ROADMAP.md](./ROADMAP.md)
