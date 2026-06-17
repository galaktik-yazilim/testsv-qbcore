# Changelog

Bu dosya sunucu geliştirme geçmişini takip eder.  
Format: [Keep a Changelog](https://keepachangelog.com/) — en yeni üstte.

---

## [Unreleased]

### Added
- [evren-ve-dil.md](docs/tanitim/evren-ve-dil.md) — Los Santos evreni, Türkçe arayüz, metrik birimler (m, km, km/s)
- [komutlar.md](docs/tanitim/komutlar.md) — tüm aktif komutlar (helper text formatı)
- **`/komutlar`** — oyun içi komut özeti (`rp-chat`, yetkiye göre PD/EMS/admin bölümleri)
- Tur 09: loading Los Santos metinleri, hoş geldin chat, `rp-ignition` phone bağımlılığı kaldırıldı, `toggle-whitelist.ps1`
- Tur 10: `scripts/verify-server-cfg.ps1` — yasak resource (`qb-phone`, voice vb.) kontrolü
- [ADIM-10-Giris-PD-Cila.md](docs/gelistirme/ADIM-10-Giris-PD-Cila.md)

### Changed
- `/kurallar`, sunucu kuralları ve tanıtım dokümanları evren/birim standardına göre güncellendi
- HUD varsayılan birimleri `km/s` + `km` (metrik fallback)
- qb-adminmenu TR locale: hız etiketi `Km/s`
- `/911` konum satırı: `Harita konumu X,Y` (Los Santos haritası)
- Beta/açılış rehberleri hazır — progress bar eklendi
- [ILERLEME.md](docs/ILERLEME.md) — genel ilerleme **58%**
- **qb-spawn:** spawn noktası etiketleri Türkçe
- **qb-policejob:** PD alert / `/fine` — `qb-phone` kapalıyken güvenli fallback; TR locale tamamlandı

### Fixed
- **qb-multicharacter:** karakter seçiminde loading ekranında takılma (`qb-apartments` kapalıyken sonsuz callback)
- **qb-multicharacter:** yeni karakter sonrası menünün tekrar açılması (`closeNUIdefault`)
- **qb-doorlock:** eksik Türkçe locale (`keymapping_description`, `newdoor_command_description`, vb.)
- **qb-policejob:** `/fine` ve PD alert — phone olmadan crash/ sessiz hata yok
- **qb-ambulancejob:** hastane faturası — phone olmadan QBCore notify

Operasyonel adımlar: [TODO.md](docs/TODO.md)

---

## [1.0.0] — 2025-06-17 — MVP kod tamamlandı

### Added
- Turlar 01–08: [DURUM.md](docs/gelistirme/DURUM.md), Adım 07/08, beta geri bildirim, oyuncu hızlı referans

### Changed
- ROADMAP MVP fazları işaretlendi
- `/kurallar` ve qb-hud km/s (metrik)

### Security
- rp-dealership model adı uzunluk limiti

---

## [0.9.0] — 2025-06-17

### Added
- Adım 04–06 dokümantasyonu, [GUVENLIK-DENETIMI.md](docs/gelistirme/GUVENLIK-DENETIMI.md)
- `/ame`, `/a` (admin), `/km`; CK/PK/MGK kuralları; NPC temizliği

### Changed
- `/ooc` kaldırıldı (yerel OOC: `/b`)
- Performans: `rp-ignition`, `rp-dealership` cleanup, keybinds `Wait(5)`

### Security
- **rp-dealership:** spawn sunucuda; `pendingSpawns` token; ödeme önce çekilir
- **qb-multicharacter:** yalnızca `cid = 1`
- **rp-mileage:** `/km` cooldown

---

## [0.8.0] — 2025-06-17

### Added
- Adım 03: whitelist ACE, MySQL setup, günlük yedek scriptleri
- Discord/başvuru + admin yönetim rehberleri
- Performans notları dokümanı

### Changed
- PD/EMS hard RP config
- sv_maxclients 32, qb_whitelist/qb_discord convar

---

## [0.7.0] — 2025-06-17

### Added
- **Adım 02** — `/911` text acil çağrı, `/kurallar` komutu
- `docs/tanitim/sunucu-kurallari.md` — tam kural metni
- `docs/gelistirme/KAPALI-BETA-CHECKLIST.md`

### Changed
- **Voice kaldırıldı:** `pma-voice`, `qb-radio` artık start edilmiyor (text RP)
- `server.cfg` voice convar'ları temizlendi

### Security
- `/911`: cooldown, sanitizasyon, yalnızca on-duty PD/EMS

---

## [0.6.0] — 2025-06-17

### Added
- **Adım 01 MVP temel** — `docs/gelistirme/ADIM-01-MVP-Temel.md`
- Karakter rehberi — `docs/tanitim/sistemler/karakter-olusturma.md`
- Sunucu tarafı karakter doğrulama (isim, yaş 18+, slot limiti)

### Changed
- Multichar: 1 slot, oyuncu karakter silme kapalı
- Başlangıç: $150 cash + $850 bank; işsiz maaş $0; paycheck 60 dk
- `loadHouseData`: yalnızca `qb-houses` aktifken çalışır

### Security
- `createCharacter` sunucu validasyonu; client bypass engellendi
- Karakter limiti ve isim sanitizasyonu sunucuda zorunlu

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
