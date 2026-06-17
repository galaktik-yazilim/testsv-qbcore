# Adım 06 — P4+ Büyüme Planı

> **Durum:** Ertelendi — kapalı beta + açılış sonrası, ihtiyaç netleşince  
> MVP ve beta stabil olmadan **başlama**.

---

## Felsefe

Her sistem “RP ile halledilir mi?” sorusundan geçer. Script eklemeden önce 2 hafta text RP ile dene.

---

## Öncelik sırası (ihtiyaç halinde)

| Sıra | Sistem | Resource adayı | Not |
|------|--------|----------------|-----|
| 1 | Meslek NPC / ekonomi | Tek tek `qb-*job` aç | Taşımacılık, tamirci… |
| 2 | Konut | `qb-apartments` veya `qb-houses` | Ağır — performans budget |
| 3 | Yaralanma | Custom veya minimal downed | EMS RP derinleşirse |
| 4 | Text SMS | Minimal telefon veya chat | `qb-phone` ağır — alternatif |
| 5 | Oyuncu araç satışı | `qb-vehiclesales` | Galeri dışı 2. el |
| 6 | Anti-cheat | FiveGuard / Electron | Oyuncu sayısı artınca |

---

## Bilinçli kapalı kalacaklar (hard RP)

- Arcade soygun scriptleri
- `qb-drugs`, `qb-crypto`, yarış meta
- Voice (`pma-voice`)
- `qb-radialmenu` (tek tık meta)
- 24/7 NPC mağazalar (`qb-shops`)

---

## Teknik borç (her zaman en son)

[TEKNIK-BORC.md](../TEKNIK-BORC.md) — yedek, MySQL kullanıcı, resmon, webhook

---

## Yeni sistem eklerken

1. [SABLON.md](../tanitim/SABLON.md) ile tanıtım doc yaz
2. `server.cfg` explicit ensure — tek resource ekle
3. Güvenlik: event doğrulama → [GUVENLIK-DENETIMI.md](./GUVENLIK-DENETIMI.md)
4. ROADMAP + CHANGELOG güncelle
