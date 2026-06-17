# Teknik Borç

> **En düşük öncelik.** Sunucu ayakta, oyuncu içeride, beta/açılış akışı oturduktan **sonra** ele alınır.  
> Unutulmasın diye burada; şu an bloklayıcı değil.

Öncelik sırası: **Sunucuyu aç** → **Kapalı beta** → **P4+ özellikler** → **bu liste**.

Aktif işler: [TODO.md](./TODO.md)

---

## Operasyon & altyapı

| Madde | Neden ertelendi | Hazır olan |
|-------|-----------------|------------|
| MySQL `fivem` kullanıcısı (root yerine) | Dev ortamında root yeterli | `scripts/setup-mysql.sql` |
| Günlük MySQL + txData yedeği | Veri birikmeden anlamsız | `scripts/backup-data.ps1`, `install-daily-backup.ps1` |
| `scripts/mysql.env` | Yedek scripti için | `scripts/mysql.env.example` |
| `resmon 1` ölçümü + kayıt | Slot dolmadan anlamlı değil | [PERFORMANS-NOTLARI.md](./gelistirme/PERFORMANS-NOTLARI.md) |
| Prod'da yavaş sorgu izleme (`EXPLAIN`) | Trafik yokken gereksiz | — |

---

## Güvenlik (ince ayar)

| Madde | Not |
|-------|-----|
| Discord webhook logları | Admin, para, araç, ban — ihtiyaç netleşince |
| OneSync slot ayarı ince ayarı | `sv_maxclients` test sonrası |
| `server.cfg` secret rotasyonu | Periyodik; zaten gitignore'da |

---

## Checklist (borç kapatılırken)

- [ ] `setup-mysql.sql` → `server.cfg` connection string `fivem` kullanıcısına geç
- [ ] `mysql.env` doldur → `backup-data.ps1` manuel test
- [ ] `install-daily-backup.ps1` (isteğe bağlı zamanlanmış görev)
- [ ] `resmon 1` — sonuçları PERFORMANS-NOTLARI'na yaz
- [ ] Webhook logları (hangi olaylar loglanacak karar verildikten sonra)

---

## İlgili dosyalar

| Dosya | Açıklama |
|-------|----------|
| [ADIM-03-Acilis.md](./gelistirme/ADIM-03-Acilis.md) | MySQL/yedek komut örnekleri |
| [admin-yonetim.md](./tanitim/admin-yonetim.md) | Olay anında manuel yedek prosedürü |
