# Hard RP / Text-Based Sunucu — Yol Haritası

> Hedef: Rina tarzı, text-based, hard roleplay sunucusu  
> Framework: QBCore (mevcut) · txAdmin · MySQL  
> Öncelikler: **Güvenlik** → **Performans** → **MVP (basit oynanabilir)** → **Beta** → **Gelişmiş sistemler (sonra)**

### Başlangıç felsefesi

İlk aşamada **gelişmiş sistem kurma.** Oyuncu girebilsin, chat RP yapsın, karakter oluştursun, araç alsın — bu kadar. Yaralanma scripti, dispatch, konut, telefon, meslek ekonomileri **açılıştan sonra**, ihtiyaç netleşince eklenir.

| Aşama | Hedef | Süre (tahmini) |
|-------|--------|----------------|
| **MVP (P1)** | 5–10 kişi içeride RP yapabilir | 1–2 hafta |
| **Kapalı beta (P2)** | Kurallar + PD/EMS config testi | +1–2 hafta |
| **Açılış (P3)** | Whitelist + Discord + yedek | +1 hafta |
| **Büyüme (P4+)** | Meslek, konut, injury vb. | Açılış sonrası |

---

## Mevcut durum özeti

| Alan | Durum |
|------|--------|
| Framework iskeleti | ✅ QBCore + oxmysql |
| Text RP chat | ✅ `rp-chat` tam (proximity, `/me` `/do` `/b` `/s` `/w`) |
| Araç RP | ✅ ignition, mileage, dealership, garaj |
| Resource yükü | ✅ Explicit `server.cfg` (~32 resource) |
| Event güvenliği | ✅ Custom `rp-*` sertleştirildi |
| Tanıtım dokümantasyonu | ✅ `docs/tanitim/` |
| MVP karakter kuralları | ✅ 1 slot, isim validasyonu, ekonomi |
| Whitelist / yedek | ✅ ACE + scriptler hazır |
| Kapalı beta | ⏳ Operasyonel test (checklist hazır) |
| Gelişmiş sistemler | — P4+ ertelendi |

---

## Faz 0 — Temel altyapı (ÖNCELİK: KRİTİK)

> Sunucu açılmadan önce. Güvenlik ve performans burada kazanılır.

### 0.1 Güvenlik

- [ ] `server.cfg` sadece txAdmin / yerel makinede; repoda **asla** gerçek key/şifre
- [ ] MySQL kullanıcısı: sadece gerekli yetkiler, güçlü şifre, localhost bind
- [ ] ACE izinleri: sadece güvenilen identifier'lar `group.admin` / `qbcore.god`
- [ ] `sv_scriptHookAllowed 0` (cheat engeli)
- [ ] OneSync ayarı (öneri: `set onesync on` veya infinity — slot sayısına göre)
- [ ] Tüm custom `RegisterNetEvent` handler'larına sunucu tarafı doğrulama ekle (Faz 1.2)
- [ ] Rate limit: chat, satın alma, mileage sync
- [ ] Discord webhook logları: admin, para, araç, ban

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

- [ ] QBCore SQL şeması import
- [ ] `rp-mileage` için `drivingdistance` kolonu (otomatik migration var)
- [ ] Düzenli yedek: `scripts/backup-data.ps1` + MySQL dump zamanlaması
- [ ] Prod'da `EXPLAIN` ile yavaş sorguları izle

### 0.4 Sunucu config şablonu

- [ ] `server.cfg.example` → explicit ensure listesi ( `[qb]` yerine )
- [ ] `qb_locale "tr"`
- [ ] `sv_maxclients` gerçekçi slot (performans testi sonrası)
- [ ] Voice: text RP sunucusunda opsiyonel; açılacaksa `voice_useSendingRangeOnly true`

---

## Faz 1 — RP çekirdeği (ÖNCELİK: YÜKSEK)

> Oyuncunun hissettiği deneyim. Text RP omurgası.

### 1.1 Chat sistemi tamamlama

- [ ] `/me` → `rp-chat`'e taşı (qb-core'daki 3D text kaldır; sadece chat)
- [ ] Mesafe katmanları: normal (20m), `/s` fısıltı (~3m), `/w` bağırma (~40m)
- [ ] `/ame` — eylem sadece yakındakilere, isim göstermeden
- [ ] `/do` formatını Rina standardına sabitle
- [ ] OOC flood koruması (cooldown)
- [ ] Chat mesaj uzunluk limiti (exploit / lag önleme)
- [ ] Admin `/a` ve `/ooc` global (yetki kontrollü)

### 1.2 Güvenlik — custom event sertleştirme

| Event | Eksik doğrulama | Yapılacak |
|-------|-----------------|-----------|
| `rp-chat:server:vehicle*` | Araçta mı, mesafe | Ped in vehicle + driver seat check |
| `rp-mileage:server:syncDelta` | Delta manipülasyonu | Rate limit + max delta/s sync + hız kontrolü |
| `rp-dealership:server:buyVehicle` | Uzaktan satın alma | Dealership mesafe + cooldown + fiyat server-side |

### 1.3 Araç RP

- [ ] `rp-ignition` — bisiklet/motor hariç tutarlılık
- [ ] `rp-mileage` — HUD entegrasyonu veya text gösterim
- [ ] `rp-dealership` — `UseTarget false` ile uyum (`[E]` interact)
- [ ] `qb-vehiclekeys` lock → chat mesajları (✅ kısmen var)
- [ ] Emniyet kemeri chat mesajı (✅ event var, client bağlantısı kontrol)

### 1.4 Karakter akışı

- [ ] `qb-multicharacter` — slot limiti, isim kuralları
- [ ] Karakter oluşturma: yaş, boy, açıklama (hard RP zorunluluğu)
- [ ] Spawn: tek başlangıç noktası veya sınırlı seçenek
- [ ] Whitelist kapalı → test; prod'da whitelist açık

### 1.5 Kurallar & dokümantasyon

- [ ] Sunucu kuralları (Discord + oyun içi `/kurallar`)
- [ ] CK / PK / MGK tanımları
- [ ] Powergaming, metagaming, OOC in IC tanımları

---

## Faz 2 — Hard RP sistemleri (ÖNCELİK: ORTA)

### 2.1 Sağlık & yaralanma

- [ ] `qb-ambulancejob` sadeleştir (hızlı revive kapat)
- [ ] Yaralanma sistemi (downed state, text-based tedavi)
- [ ] Hastane RP akışı (script değil prosedür + minimal mekanik)

### 2.2 Polis & adalet

- [ ] `qb-policejob` — hard RP prosedürleri
- [ ] Kelepçe, arama, el koyma → chat `/me` zorunluluğu
- [ ] Dispatch: minimal text tabanlı (911 chat komutu)
- [ ] Hapishane: `qb-prison` veya custom text RP

### 2.3 Ekonomi

- [ ] Başlangıç parası düşük
- [ ] `qb-banking` ATM / transfer
- [ ] İş verme admin/onaylı (otomatik job NPC'leri kapalı)
- [ ] Vergi / maaş döngüsü (management)

### 2.4 Envanter & eşya

- [ ] `qb-inventory` ağırlık / slot dengesi
- [ ] Silah ruhsatı RP'si (metadata)
- [ ] Crafting: başlangıçta kapalı veya çok sınırlı

### 2.5 Admin araçları

- [ ] `qb-adminmenu` yetki seviyeleri
- [ ] Spectate, freeze, warn log
- [ ] txAdmin + Discord entegrasyonu

---

## Faz 3 — İçerik & büyüme (ÖNCELİK: DÜŞÜK)

- [ ] Konut: `qb-apartments` veya `qb-houses`
- [ ] Oyuncu araç satışı: `qb-vehiclesales`
- [ ] Tamirci: `qb-mechanicjob`
- [ ] Minimal telefon (text SMS) veya tamamen chat tabanlı
- [ ] Özel MLO / harita (performans budget ile)
- [ ] Faction başvuruları (PD, EMS, mekanik)

---

## Faz 4 — Launch hazırlığı

- [ ] Kapalı beta (5–10 oyuncu, stress test)
- [ ] `resmon` / txAdmin performans profili
- [ ] 48+ slot hedefi için sunucu donanımı ve OneSync testi
- [ ] Whitelist + Discord başvuru botu
- [ ] Tanıtım materyalleri

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
| Client'tan para/item verme yok | ⚠️ Tüm ekonomi server-side doğrulanmalı |
| Event spam koruması | ✅ rp-chat, rp-mileage, rp-dealership |
| SQL injection | ✅ oxmysql parametreli sorgular |
| Admin komutları ACE korumalı | ⚠️ Gözden geçir |
| Anti-cheat (opsiyonel) | Faz 4 — Electron/FiveGuard vb. |

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

## Önerilen çalışma sırası

### Şimdi (MVP'ye kadar)
1. Yerel `server.cfg` güncelle + `resmon` ölçümü
2. Karakter: 1 slot, whitelist, düşük başlangıç parası
3. Kurallar metni + kapalı beta (3–5 kişi)

### Beta sonrası (P3)
4. Discord + başvuru formu + yedekleme
5. Açılış

### Açılış sonrası (P4+ — acele etme)
6. İhtiyaç halinde: basit `/911`, meslek açma, konut, injury scripti

~~6. Faz 2.1 — Yaralanma~~ → **P4+**, MVP'de gerek yok

---

## İlgili dosyalar

| Dosya | Açıklama |
|-------|----------|
| [TODO.md](./TODO.md) | Aktif görev listesi (checkbox) |
| [CHANGELOG.md](../CHANGELOG.md) | Yapılan değişiklikler |
| [tanitim/README.md](./tanitim/README.md) | Türkçe sistem & meslek rehberleri |
| `QBCore_2F0666.base/server.cfg.example` | Sunucu başlatma şablonu |
