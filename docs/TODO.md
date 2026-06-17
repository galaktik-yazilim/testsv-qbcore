# Aktif TODO Listesi

> Detaylı bağlam: [ROADMAP.md](./ROADMAP.md) · Tanıtım: [tanitim/README.md](./tanitim/README.md)  
> Tamamlanan işler: [CHANGELOG.md](../CHANGELOG.md)

Durum: `[ ]` yapılacak · `[x]` bitti · `[—]` bilinçli ertelendi

---

## Öncelik mantığı

Başlangıçta **oynanabilir, güvenli, sade bir sunucu** hedeflenir. Gelişmiş sistemler ancak MVP çalıştıktan ve kapalı beta alındıktan sonra gelir.

| Seviye | Anlam | Ne zaman? |
|--------|--------|-----------|
| **P0** | Olmazsa sunucu açılmaz / exploit riski | Şimdi |
| **P1** | MVP — ilk oyuncular girebilir | P0 bitince |
| **P2** | Kapalı beta — küçük grupla test | MVP stabil olunca |
| **P3** | Açılış öncesi cilalar | Beta sonrası |
| **P4+** | Gelişmiş / büyük sistemler | **Erken aşamada yapma** |

**P4+ örnekleri (şimdilik dokunma):** yaralanma scripti, dispatch paneli, konut, telefon, taşımacılık mesleği, Discord bot, CK sistemi, custom MLO, anti-cheat.

---

## Şu an neredeyiz?

```
P0 ██████████░  ~%90   (kalan: resmon ölçümü, yerel server.cfg, MySQL kullanıcısı)
P1 ██████░░░░  ~%60   (chat/araç bitti; karakter kuralları + whitelist kaldı)
P2 ░░░░░░░░░░  %0     (henüz başlama)
P3 ░░░░░░░░░░  %0
P4 ░░░░░░░░░░  bilinçli ertelendi
```

---

## P0 — Kritik (şimdi)

> Güvenlik + performans. Gelişmiş özellik yok.

- [x] Explicit `server.cfg` (arcade scriptler kapalı)
- [x] Custom `rp-*` event güvenliği
- [x] `qb_locale` → `tr`
- [x] Tanıtım dokümantasyonu (`docs/tanitim/`)
- [ ] Yerel `server.cfg` güncelle (example'dan kopyala)
- [ ] MySQL: ayrı kullanıcı, minimum yetki, güçlü şifre
- [ ] Boş sunucuda `resmon 1` — önce/sonra ms kaydet

---

## P1 — MVP (ilk oynanabilir sürüm)

> Text RP + karakter + araç + para. **Basit tut.**

### Karakter & giriş
- [ ] Multichar slot: **1** (hard RP için yeterli; sonra artırılır)
- [ ] Gerçekçi isim kuralı (config veya basit sunucu kuralı metni)
- [ ] Whitelist: txAdmin veya `QBCore.Config.Server.Whitelist = true` + manuel onay
- [ ] Başlangıç parası: düşük cash/bank (`qb-core` config) — tek rakam, karmaşık ekonomi yok

### Oyun içi minimum
- [x] Proximity chat + `/me` `/do` `/b` `/s` `/w`
- [x] Araç: galeri, kontak, km, garaj, yakıt
- [ ] Sunucu kuralları metni (Discord + `docs/tanitim/genel-baslangic.md` güncelle)
- [ ] Türkçe: sadece **aktif** resource locale'leri (tüm 56 değil)

### Bilinçli olarak MVP'de yok
- [—] Telefon, konut, meslek NPC'leri, soygun, drugs
- [—] Özel yaralanma / downed scripti
- [—] Dispatch, MDW, kanıt sistemi
- [—] Taşımacılık ve diğer meslekler

---

## P2 — Kapalı beta (5–15 kişi)

> MVP stabil; gerçek oyuncu davranışına göre ince ayar.

- [ ] 3–7 gün kapalı beta test planı (checklist)
- [ ] PD/EMS: mevcut `qb-policejob` / `qb-ambulancejob` — sadece **config sadeleştirme**, yeni script yok
- [ ] Basit `/911 [mesaj]` chat komutu (dispatch paneli **değil**)
- [ ] Admin: txAdmin warn/kick/ban prosedürü dokümante et
- [ ] Beta geri bildirimlerine göre chat mesafeleri / ekonomi rakamları ayarla

---

## P3 — Açılış öncesi

> Herkese açılmadan hemen önce.

- [ ] Discord sunucu + kurallar + başvuru (Google Form yeterli; bot şart değil)
- [ ] Sunucu açıklaması, tag'ler, logo
- [ ] Günlük MySQL yedek (`scripts/backup-data.ps1` + zamanlama)
- [ ] Slot sayısı ve OneSync kararı (performans testine göre)

---

## P4+ — Sonra (açılıştan sonra, ihtiyaç halinde)

> **Başlangıçta yapma.** Oyuncu kitlesi ve ihtiyaç netleşince tek tek.

| Sistem | Neden ertelendi |
|--------|-----------------|
| Yaralanma / downed scripti | qb-ambulancejob MVP'de yeter; custom script büyük iş |
| Discord webhook logları | txAdmin + manuel moderasyon MVP'de yeter |
| Konut (`qb-houses`) | Ekonomi + admin yükü; önce core RP otursun |
| Minimal telefon | Text RP'de chat yeterli |
| Taşımacılık / ek meslekler | Whitelist faction + rehber hazır olunca |
| `qb-mechanicjob`, tamirci ekonomisi | Araç zaten var; tamirci faction sonra |
| CK / PK otomasyonu | Önce kurallar metni + admin kararı yeter |
| Anti-cheat (FiveGuard vb.) | Slot artınca değerlendir |
| Custom MLO / harita | Performans bütçesi sonra |
| HUD tam yeniden yazımı | Mevcut sadeleştirilmiş `qb-hud` yeter |

---

## Tamamlananlar (arşiv)

<details>
<summary>P0–P1 tamamlanan maddeler</summary>

- [x] Resource budama, arcade scriptler kapalı
- [x] Event güvenliği (rp-chat, rp-mileage, rp-dealership)
- [x] Chat: `/me` `/s` `/w`, flood limit, 256 karakter
- [x] Galeri `[E]` interact, spawn bağımsız
- [x] Kemer → chat entegrasyonu
- [x] Tanıtım rehberleri (sistemler + polis/EMS taslağı)

</details>

---

## Sıradaki 3 iş (önerilen sıra)

1. **Yerel `server.cfg` güncelle** + sunucu restart
2. **P1 karakter:** 1 slot + whitelist + düşük başlangıç parası
3. **Kapalı beta** için 3–5 kişiyle chat/araç/galeri testi

---

## Notlar

| Tarih | Not |
|-------|-----|
| 2025-06-17 | Öncelikler MVP odaklı yeniden düzenlendi; P4+ bilinçli ertelendi |
| 2025-06-17 | P0 güvenlik + chat/araç geliştirmeleri tamamlandı |
