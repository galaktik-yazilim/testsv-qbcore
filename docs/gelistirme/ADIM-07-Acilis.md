# Adım 07 — Açılış

> **Durum:** ✅ Hazır (rehber) — kapalı beta sonrası uygula

---

## Ön koşul

- [Adım 05](./ADIM-05-Kapali-Beta.md) beta tamamlandı
- Kritik bug'lar giderildi
- [BETA-GERI-BILDIRIM.md](./BETA-GERI-BILDIRIM.md) toplandı

---

## Açılış checklist

### Sunucu
- [ ] `sets qb_discord` gerçek invite
- [ ] `sv_hostname`, `projectDesc` güncel
- [ ] Whitelist açık ([Adım 05](./ADIM-05-Kapali-Beta.md))
- [ ] Restart planı (txAdmin scheduled)

### Discord
- [ ] Kurallar pin — [sunucu-kurallari.md](../tanitim/sunucu-kurallari.md)
- [ ] Başvuru kanalı / form — [discord-ve-basvuru.md](../tanitim/discord-ve-basvuru.md)
- [ ] `#duyurular` açılış metni

### Oyuncu deneyimi
- [ ] [genel-baslangic.md](../tanitim/genel-baslangic.md) linki Discord'da
- [ ] [oyuncu-hizli-referans.md](../tanitim/oyuncu-hizli-referans.md) pin (opsiyonel)

### Admin
- [ ] [admin-yonetim.md](../tanitim/admin-yonetim.md) prosedürü ekip biliyor
- [ ] CK prosedürü net

---

## Açılış günü

1. Son restart — konsol temiz
2. Adminler içerde smoke test (5 dk)
3. Whitelist'li oyunculara duyuru
4. İlk saat admin gözetimi

---

## Açılış sonrası

- [Adım 06 P4+](./ADIM-06-P4-Plan.md) — ihtiyaç halinde tek sistem ekle
- [Adım 08 teknik borç](./ADIM-08-Teknik-Borc.md) — yedek, MySQL user

---

## Tüm adımlar

| 01–06 | MVP → beta → P4 plan |
| 07 | Açılış | Bu dosya |
| 08 | Teknik borç | [ADIM-08-Teknik-Borc.md](./ADIM-08-Teknik-Borc.md) |
