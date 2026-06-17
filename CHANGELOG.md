# Changelog

Bu dosya sunucu geliştirme geçmişini takip eder.  
Format: [Keep a Changelog](https://keepachangelog.com/) — en yeni üstte.

---

## [Unreleased]

### Planlanan
- Whitelist ve karakter başvuru akışı
- Minimal HUD veya `qb-hud` tam sadeleştirme
- Taşımacılık mesleği rehberi + resource

---

## [0.5.0] — 2025-06-17

### Added
- **Türkçe tanıtım dokümantasyonu** — `docs/tanitim/` (sistemler, meslekler, şablon)
- Chat: `/s` (fısıltı), `/w` (bağırma) mesafe katmanları
- Chat: flood cooldown, mesaj uzunluk limiti (256)
- `rp-dealership:server:spawnPurchased` — qb-vehicleshop bağımlılığı kaldırıldı

### Changed
- **server.cfg.example** — explicit resource listesi (`ensure [qb]` kaldırıldı, ~30 resource)
- `qb_locale` → `tr`, güvenlik convar'ları, voice mesafe sınırı
- `/me` komutu `rp-chat`'e taşındı (3D text kaldırıldı)
- `rp-dealership`: `UseTarget = false`, sunucu mesafe + satın alma cooldown
- `rp-mileage`: sürücü/plaka doğrulama, sync rate limit

### Security
- Tüm `rp-chat:server:vehicle*` event'leri: sürücü koltuğu + cooldown
- `rp-mileage:server:syncDelta`: plaka eşleşmesi, max delta, dakika limiti
- `rp-dealership:server:buyVehicle`: mesafe doğrulama, sahiplik kontrollü spawn

---

## [0.4.0] — 2025-06-XX

### Added
- Araç satın alma: client shop kapalıyken showroom engeli + bildirim
- Galeri blip yönetimi ve showroom temizleme iyileştirmeleri

### Changed
- `qb-vehicleshop` / `rp-dealership` showroom çakışma önleme

---

## [0.3.0] — 2025-06-XX

### Added
- **rp-chat notify sistemi** — QBCore toast mesajları chat'e yönlendirilir
- `rp-chat/client/notify.lua` — chat tabanlı bildirimler
- Notify renkleri ve prefix'leri (`config.lua`)

### Changed
- Hata mesajları `QBCore:Notify` yerine `rp-chat:Notify` kullanır

---

## [0.2.5] — 2025-06-XX

### Added
- Türkçe locale dosyaları: ambulance, banking, bank robbery, clothing, crafting, crypto

---

## [0.2.0] — 2025-06-XX

### Added
- **rp-ignition** — text RP araç kontağı (chat mesajı ile)
- Araç kilitleme chat entegrasyonu (`qb-vehiclekeys` → `rp-chat`)
- Emniyet kemeri chat event'i (`rp-chat:server:vehicleSeatbelt`)

### Changed
- Kontak ve kilit keybind'leri güncellendi
- `rp-dealership` gereksiz NPC spawn kaldırıldı (performans)

### Removed
- Dealership NPC spawn logic

---

## [0.1.5] — 2025-06-XX

### Changed
- **NPC/traffic density = 0** (`qb-smallresources`) — performans ve hard RP atmosferi
- Ambient population kontrolü

---

## [0.1.0] — 2025-06-XX

### Added
- **rp-mileage** — araç kilometresi takibi (`player_vehicles.drivingdistance`)
- Client/server sync (10 sn interval, max delta koruması)
- HUD mileage entegrasyonu (eski distance tracking devre dışı)

### Changed
- Araç satın alma: DB'ye `drivingdistance = 0` ile kayıt

---

## [0.0.5] — 2025-06-XX

### Added
- **rp-dealership** — LS Cars galeri, katalog, filtre, satın alma UI
- `rp-dealership/config.lua` — dealership noktaları, blip, marker

---

## [0.0.4] — 2025-06-XX

### Changed
- **qb-hud** sadeleştirme: stress gösterimi kapalı
- Para sync fonksiyonları (cash/bank HUD)
- Stamina devre dışı seçeneği (infinite stamina)
- Oksijen göstergesi kaldırıldı
- RAGE MP tarzı HUD bileşenleri (cash, bank, player info bar)

---

## [0.0.3] — 2025-06-XX

### Added
- **rp-chat** — RAGE MP tarzı proximity chat
- Yakınlık bazlı normal konuşma (global chat yok)
- `/b` (yerel OOC), `/do` (ortam)
- Chat her zaman görünür (`client/main.lua`)
- Chat CSS/JS tema

### Removed
- `testsv-chat` resource

### Changed
- `server.cfg.example`: `ensure rp-chat`

---

## [0.0.2] — 2025-06-XX

### Added
- `testsv-chat` — proximity chat prototipi

---

## [0.0.1] — 2025-06-XX

### Added
- İlk QBCore FiveM sunucu kurulumu (txAdmin `txData` yapısı)
- `.gitignore` stratejisi (sırlar ve runtime data repoda yok)
- `server.cfg.example`, `admins.json.example`
- `scripts/backup-data.ps1` yedekleme scripti
- Tam QBCore resource paketi (`[qb]`, `[standalone]`, `[voice]`, `[defaultmaps]`)

---

## Resource envanteri (referans)

### Custom (bizim yazdığımız / özelleştirdiğimiz)
| Resource | Durum |
|----------|--------|
| `rp-chat` | Aktif — geliştirilecek |
| `rp-ignition` | Aktif |
| `rp-mileage` | Aktif |
| `rp-dealership` | Aktif — güvenlik iyileştirmesi bekliyor |

### QBCore paketi
56 resource `[qb]` klasöründe — **çoğu hard RP için kapalı olmalı** (bkz. ROADMAP Faz 0.2)
