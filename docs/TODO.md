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
P0 ██████████░  ~%95   (kalan: resmon, MySQL kullanıcısı)
P1 █████████░  ~%90   (whitelist açma kaldı)
P2 ░░░░░░░░░░  checklist hazır — beta test bekliyor
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
- [x] Yerel `server.cfg` explicit ensure listesi (voice kaldırıldı)
- [ ] MySQL: ayrı kullanıcı, minimum yetki, güçlü şifre
- [ ] Boş sunucuda `resmon 1` — voice kaldırıldıktan sonra ms kaydet

---

## P1 — MVP (ilk oynanabilir sürüm)

> Text RP + karakter + araç + para. **Basit tut.**

### Karakter & giriş
- [x] Multichar slot: **1**
- [x] Gerçekçi isim kuralı — sunucu tarafı doğrulama
- [ ] Whitelist: kapalı beta için aç (config + txAdmin)
- [x] Başlangıç parası: $150 cash + $850 bank, işsiz maaş $0

### Oyun içi minimum
- [x] Proximity chat + `/me` `/do` `/b` `/s` `/w`
- [x] Araç: galeri, kontak, km, garaj, yakıt
- [x] Sunucu kuralları + `/kurallar` + `/911`
- [x] Voice kaldırıldı (`pma-voice`, `qb-radio`)
- [ ] Türkçe: sadece **aktif** resource locale'leri

### Bilinçli olarak MVP'de yok
- [—] Telefon, konut, meslek NPC'leri, soygun, drugs
- [—] Özel yaralanma / downed scripti
- [—] Dispatch paneli, MDW, kanıt sistemi
- [—] Taşımacılık ve diğer meslekler
- [—] Voice chat altyapısı

---

## P2 — Kapalı beta (5–15 kişi)

> MVP stabil; gerçek oyuncu davranışına göre ince ayar.

- [x] Kapalı beta checklist — [KAPALI-BETA-CHECKLIST.md](gelistirme/KAPALI-BETA-CHECKLIST.md)
- [ ] PD/EMS config sadeleştirme (yeni script yok)
- [x] `/911` text acil çağrı
- [ ] Admin: txAdmin warn/kick/ban prosedürü dokümante et
- [ ] Beta testi (5–15 oyuncu)

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
- [x] `/911`, `/kurallar`, voice kaldırma, sunucu kuralları

</details>

---

## Sıradaki 3 iş

1. **Restart** + `resmon 1` (voice yok mu doğrula)
2. **Whitelist aç** — kapalı beta
3. **Beta checklist** ile 5–15 kişi test — [KAPALI-BETA-CHECKLIST.md](gelistirme/KAPALI-BETA-CHECKLIST.md)

---

## Notlar

| Tarih | Not |
|-------|-----|
| 2025-06-17 | Öncelikler MVP odaklı yeniden düzenlendi; P4+ bilinçli ertelendi |
| 2025-06-17 | Adım 02: voice kaldırıldı, /911, kurallar |
| 2025-06-17 | Adım 01: MVP karakter + ekonomi + server.cfg |
