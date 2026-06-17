# Adım 23 — Metadata & EMS/PD Güvenlik

> **Durum:** ✅ Kod tamamlandı  
> Oyuncu testi: kelepçe, ölüm/revive, EMS alert

---

## Bu turda ne yaptık?

| Konu | Dosya |
|------|--------|
| Kelepçe metadata sunucu otoritesi | `qb-policejob/server/interactions.lua`, `main.lua` |
| Ölüm/laststand temizleme token | `qb-ambulancejob/server/main.lua` |
| EMS alert spam + sanitize | `qb-ambulancejob/server/main.lua` |
| EMS on duty: revive, treat, doctor sayacı | `qb-ambulancejob/server/main.lua` |
| Multichar NUI fallback TR | `qb-multicharacter/html/translations.js` |
| Spawn sayfa başlığı TR | `qb-spawn/html/index.html` |

---

## Test et

- [ ] PD kelepçe / sökme — metadata doğru
- [ ] Ölüm → respawn / EMS revive — metadata temizleniyor
- [ ] Client ile sahte revive (`SetDeathStatus false`) — çalışmaz
- [ ] EMS off duty — bandaj/revive işlemi yok
- [ ] Karakter ekranı — locale yüklenmezse bile Türkçe fallback

---

## Sonraki adım

Operasyonel test → [OYUN-ICI-TEST-HIZLI.md](./OYUN-ICI-TEST-HIZLI.md)
