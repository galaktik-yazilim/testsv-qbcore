# Hard RP / Text-Based Sunucu — Yol Haritası

> Hedef: Rina tarzı, text-based, hard roleplay sunucusu  
> Framework: QBCore (mevcut) · txAdmin · MySQL  
> Öncelikler: **Güvenlik** → **Performans** → **MVP (basit oynanabilir)** → **Beta** → **Gelişmiş sistemler (sonra)**

### Başlangıç felsefesi

**Evren:** Los Santos (Amerika). **Dil:** Türkçe arayüz. **Birimler:** metrik (m, km, km/s). Bkz. [tanitim/evren-ve-dil.md](./tanitim/evren-ve-dil.md)

İlk aşamada **gelişmiş sistem kurma.** Oyuncu girebilsin, chat RP yapsın, karakter oluştursun, araç alsın — bu kadar. Yaralanma scripti, dispatch, konut, telefon, meslek ekonomileri **açılıştan sonra**, ihtiyaç netleşince eklenir.

| Aşama | Hedef | Süre (tahmini) |
|-------|--------|----------------|
| **MVP (P1)** | 5–10 kişi içeride RP yapabilir | 1–2 hafta |
| **Kapalı beta (P2)** | Kurallar + PD/EMS config testi | +1–2 hafta |
| **Açılış (P3)** | Whitelist + Discord | +1 hafta |
| **Büyüme (P4+)** | Meslek, konut, injury vb. | Açılış sonrası |
| **Teknik borç** | Yedek, MySQL kullanıcı, resmon | En son — [TEKNIK-BORC.md](./TEKNIK-BORC.md) |

---

## Mevcut durum özeti

> **Genel ilerleme: 58%** (açılışa kadar) — [ILERLEME.md](./ILERLEME.md)  
> **Kod geliştirmesi tamamlandı** (turlar 01–08). Detay: [gelistirme/DURUM.md](./gelistirme/DURUM.md)

| Alan | Durum |
|------|--------|
| Geliştirme turları 01–08 | ✅ kod + doc |
| Operasyon (test/beta/açılış) | ⏳ [TODO.md](./TODO.md) |
| P4+ backlog | 📋 [ADIM-06-P4-Plan.md](./gelistirme/ADIM-06-P4-Plan.md) |
| Teknik borç | 📋 [ADIM-08-Teknik-Borc.md](./gelistirme/ADIM-08-Teknik-Borc.md) |

| Alan | Durum |
|------|--------|
| Framework iskeleti | ✅ QBCore + oxmysql |
| Text RP chat | ✅ proximity, `/me` `/ame` `/do` `/b` `/s` `/w` `/a` |
| Araç RP | ✅ ignition, mileage, dealership, garaj |
| Resource yükü | ✅ ~32 explicit resource |
| Event güvenliği | ✅ [GUVENLIK-DENETIMI.md](./gelistirme/GUVENLIK-DENETIMI.md) |
| Tanıtım dokümantasyonu | ✅ `docs/tanitim/` |
| Whitelist | ✅ hazır — testte kapalı |

---

## Faz 0 — Temel altyapı (ÖNCELİK: KRİTİK)

> Sunucu açılmadan önce. Güvenlik ve performans burada kazanılır.

### 0.1 Güvenlik

- [x] `server.cfg` gitignore'da; repoda key/şifre yok
- [x] `sv_scriptHookAllowed 0`
- [x] Custom event doğrulama + rate limit (rp-*)
- [x] [GUVENLIK-DENETIMI.md](./gelistirme/GUVENLIK-DENETIMI.md)
- [ ] ACE: yalnızca güvenilen admin identifier'lar (operasyonel kontrol)
- [ ] MySQL ayrı kullanıcı, webhook → [ADIM-08-Teknik-Borc.md](./gelistirme/ADIM-08-Teknik-Borc.md)

### 0.2 Performans — resource budama (en büyük kazanç)

**Sorun:** `ensure [qb]` klasördeki **tüm** scriptleri başlatır. Hard RP için ~30+ gereksiz resource RAM/CPU yer.

**Hedef:** Explicit `ensure` listesi; klasör bazlı toplu yükleme kaldırılacak.

#### Tutulacaklar (çekirdek)

```
oxmysql, connectqueue, PolyZone, progressbar, interact-sound, bob74_ipl
qb-core, qb-multicharacter, qb-spawn, qb-loading, qb-clothing
qb-inventory, qb-weapons, qb-banking
qb-vehiclekeys, qb-garages, qb-fuel
qb-doorlock, qb-weathersync, qb-smallresources
qb-input, qb-menu
qb-policejob, qb-ambulancejob
qb-adminmenu
rp-chat, rp-ignition, rp-mileage, rp-dealership
pma-voice, qb-radio — bilinçli kapalı (text RP)
```

#### Devre dışı bırakılacaklar (arcade / çakışma / fazla)

| Resource | Neden |
|----------|--------|
| `qb-bankrobbery`, `qb-jewelery`, `qb-storerobbery`, `qb-houserobbery`, `qb-truckrobbery` | Arcade soygun — hard RP'de script değil RP |
| `qb-drugs`, `qb-weed`, `qb-crypto` | Arcade ekonomi |
| `qb-streetraces`, `qb-lapraces` | Yarış meta |
| `qb-hotdogjob`, `qb-busjob`, `qb-taxijob`, `qb-towjob`, `qb-garbagejob`, `qb-newsjob`, `qb-vineyard`, `qb-diving`, `qb-recyclejob`, `qb-scrapyard`, `qb-pawnshop` | Başlangıçta kapalı; ihtiyaç olunca tek tek açılır |
| `qb-vehicleshop` | `rp-dealership` ile çakışır |
| `qb-phone` | Ağır NUI; text RP için sonra minimal alternatif |
| `qb-radialmenu` | Tek tık etkileşim — text RP ile çelişir |
| `qb-scoreboard` | Meta bilgi; hard RP'de genelde kapalı |
| `qb-minigames`, `safecracker` | Minigame arcade |
| `qb-hud` | Sadeleştirilmiş HUD'a geç veya minimal HUD yaz |
| `qb-target` | `UseTarget false` ile zaten kapalı; dealership config'i `[E]` ile uyumlu hale getir |
| `menuv/menuv_example` | Örnek resource — **asla start etme** |
| `screenshot-basic` | Sadece admin ihtiyacında |

#### Konut / ileri sistem (Faz 3'e ertele)

`qb-apartments`, `qb-houses`, `qb-houserobbery`, `qb-interior`, `qb-mechanicjob`, `qb-prison`, `qb-management`, `qb-vehiclesales`, `qb-crafting`

### 0.3 Veritabanı

- [ ] QBCore SQL şeması import (operasyonel)
- [x] `rp-mileage` drivingdistance migration
- [ ] Yedek → [ADIM-08-Teknik-Borc.md](./gelistirme/ADIM-08-Teknik-Borc.md)

### 0.4 Sunucu config şablonu

- [x] `server.cfg.example` explicit ensure
- [x] `qb_locale "tr"`
- [x] `sv_maxclients 32` (example)
- [x] Voice kapalı (text RP)

---

## Faz 1 — RP çekirdeği (ÖNCELİK: YÜKSEK)

> Oyuncunun hissettiği deneyim. Text RP omurgası.

### 1.1 Chat sistemi

- [x] `/me`, `/ame`, `/do`, `/b`, `/s`, `/w` — rp-chat
- [x] `/a` admin, `/kurallar`, `/911`
- [x] Cooldown + 256 char limit
- [x] `/ooc` kaldırıldı → `/b`

### 1.2 Güvenlik — custom events

- [x] rp-chat vehicle events
- [x] rp-mileage syncDelta
- [x] rp-dealership buy/spawn

### 1.3 Araç RP

- [x] rp-ignition (bisiklet hariç)
- [x] `/km` mileage
- [x] rp-dealership `[E]`
- [x] kilit + kemer → chat

### 1.4 Karakter

- [x] 1 slot, isim/yaş validasyonu, cid=1
- [x] SkipSelection spawn
- [x] Whitelist altyapı (testte kapalı)

### 1.5 Kurallar

- [x] sunucu-kurallari.md, `/kurallar`
- [x] CK/PK/MGK tanımları

---

## Faz 2 — Hard RP (kısmi — MVP yeterli)

### 2.1 Sağlık

- [x] EMS config (self-revive kapalı, envanter korunur)
- [ ] Yaralanma scripti → P4+
- [x] Hastane prosedür doc → saglik-gorevlisi.md

### 2.2 Polis

- [x] `/911` text dispatch
- [x] PD config (fuel, spike)
- [x] polis.md prosedür

### 2.3 Ekonomi

- [x] Düşük başlangıç parası, işsiz maaş 0
- [x] qb-banking aktif
- [ ] Vergi/management → P4+

### 2.4–2.5

- [x] Crafting kapalı (resource yok)
- [x] qb-adminmenu + txAdmin doc

---

## Faz 3 — P4+ backlog

→ [ADIM-06-P4-Plan.md](./gelistirme/ADIM-06-P4-Plan.md) — açılış sonrası

---

## Faz 4 — Launch (operasyonel)

→ [ADIM-05](./gelistirme/ADIM-05-Kapali-Beta.md) · [ADIM-07](./gelistirme/ADIM-07-Acilis.md) · [TODO.md](./TODO.md)

---

## Performans kontrol listesi

| Kontrol | Hedef |
|---------|--------|
| Aktif resource sayısı | < 35 (hard RP için) |
| Boş sunucu idle resmon | Her script < 0.05ms ideal |
| Client thread sayısı | Gereksiz `while true do Wait(0)` yok |
| NPC/traffic density | ✅ `qb-smallresources` density=0 |
| NUI sayısı | Phone/HUD minimize |
| MySQL | Prepared statements (oxmysql ✅), index'li plate/citizenid |
| Asset streaming | Gereksiz map paketi yok |

---

## Güvenlik kontrol listesi

| Kontrol | Durum |
|---------|--------|
| Sırlar `.gitignore`'da | ✅ |
| Client'tan para/item verme yok | ✅ rp-dealership server-side |
| Event spam koruması | ✅ rp-chat, rp-mileage, rp-dealership |
| SQL injection (custom kod) | ✅ oxmysql parametreli |
| Admin komutları ACE korumalı | ✅ admin/god |
| Anti-cheat | P4+ backlog |

---

## Bağımlılık haritası (custom rp-*)

```
qb-core
  ├── rp-chat ──────► qb-vehiclekeys (lock mesajları)
  ├── rp-ignition ──► rp-chat, qb-vehiclekeys
  ├── rp-mileage ───► qb-core, oxmysql
  └── rp-dealership ► qb-core, oxmysql, qb-target (opsiyonel)
```

---

## Önerilen sıra (operasyonel)

1. [ADIM-04](./gelistirme/ADIM-04-Test-Cila.md) — oyun içi test
2. [ADIM-05](./gelistirme/ADIM-05-Kapali-Beta.md) — whitelist + beta
3. [ADIM-07](./gelistirme/ADIM-07-Acilis.md) — açılış
4. [ADIM-06](./gelistirme/ADIM-06-P4-Plan.md) — ihtiyaç halinde
5. [ADIM-08](./gelistirme/ADIM-08-Teknik-Borc.md) — en son

---

## İlgili dosyalar

| Dosya | Açıklama |
|-------|----------|
| [DURUM.md](./gelistirme/DURUM.md) | Geliştirme turları özeti |
| [TODO.md](./TODO.md) | Operasyonel checklist |
| [CHANGELOG.md](../CHANGELOG.md) | Yapılan değişiklikler |
| [tanitim/README.md](./tanitim/README.md) | Türkçe sistem & meslek rehberleri |
| `QBCore_2F0666.base/server.cfg.example` | Sunucu başlatma şablonu |
