# Güvenlik Denetimi — rp-* & MVP

> Son güncelleme: Tur 23 metadata güvenlik  
> Kapsam: `rp-chat`, `rp-mileage`, `rp-dealership`, `rp-ignition`, `qb-multicharacter` (MVP değişiklikleri)

---

## Özet

| Alan | Durum |
|------|--------|
| Custom event doğrulama | ✅ |
| Ekonomi (araç satın alma) | ✅ düzeltildi |
| Karakter oluşturma | ✅ |
| SQL injection (custom kod) | ✅ parametreli sorgular |
| Whitelist | Kapalı (test) — açılışta açılacak |
| Anti-cheat | Yok (bilinçli ertelendi) |

---

## rp-dealership

| Risk | Durum | Not |
|------|--------|-----|
| Uzaktan satın alma | ✅ | `isNearDealership` + cooldown |
| Client spawn koordinatı | ✅ **düzeltildi** | Spawn sunucu config'den; client coords kaldırıldı |
| Rastgele araç spawn | ✅ **düzeltildi** | `pendingSpawns` token — satın alma sonrası 90 sn |
| Fiyat manipülasyonu | ✅ | Fiyat `sharedVehicles` sunucudan |
| Para çekilmeden araç | ✅ **düzeltildi** | Önce `RemoveMoney`, insert fail → iade |
| Model injection | ✅ | Model shared listesinde + max 64 char |

---

## rp-mileage

| Risk | Durum | Not |
|------|--------|-----|
| Sahte km artışı | ✅ | Sürücü koltuğu, plaka, max delta, sync/dk limiti |
| `/km` spam | ✅ | 3 sn cooldown |

---

## rp-chat

| Risk | Durum | Not |
|------|--------|-----|
| Chat flood | ✅ | Cooldown + 256 char |
| HTML inject | ✅ | Sanitize |
| Araç event spoof | ✅ | Sürücü koltuğu + cooldown |
| `/a` yetkisiz | ✅ | QBCore `admin` permission |
| `/911` spam | ✅ | 60 sn cooldown |
| `/disari` metadata spoof | ✅ | Komut cooldown + `disariDone` player guard |

---

## qb-vehiclekeys

| Risk | Durum | Not |
|------|--------|-----|
| Uzaktan anahtar alma | ✅ **düzeltildi** | DB sahiplik veya sürücü koltuğu |
| Uzaktan kilit | ✅ **düzeltildi** | 15 m mesafe kontrolü |

---

## qb-policejob

| Risk | Durum | Not |
|------|--------|-----|
| Impound yetkisiz | ✅ **düzeltildi** | LEO + on duty + değer sınırı |
| Obje / spike spawn | ✅ **düzeltildi** | LEO + on duty |
| Stash / delil off duty | ✅ **düzeltildi** | on duty zorunlu |
| `policeAlert` spam | ✅ **düzeltildi** | 30 sn cooldown + 256 char |
| Heli spotlight | ✅ **düzeltildi** | LEO + on duty |
| `SetHandcuffStatus` client spoof | ✅ **düzeltildi** | Sunucu otoritesi (CuffPlayer) |

---

## qb-smallresources

| Risk | Durum | Not |
|------|--------|-----|
| Hunger/thirst max spoof | ✅ **düzeltildi** | 0–100 clamp |
| Tackle uzaktan | ✅ **düzeltildi** | 3 m mesafe |
| Discord log client spam | ✅ **düzeltildi** | `death` only + cooldown |

---

## qb-multicharacter (MVP)

| Risk | Durum | Not |
|------|--------|-----|
| Client isim/yaş bypass | ✅ | Sunucu validasyonu |
| Slot aşımı | ✅ | COUNT + max 1 |
| Yanlış slot (cid) | ✅ **düzeltildi** | Yalnızca `cid = 1` |
| Başkasının karakteri | ✅ | `QBCore.Player.Login` license eşleşmesi |
| Oyuncu silme | ✅ | `EnableDeleteButton = false` |
| `GetServerLogs` herkese açık | ✅ **düzeltildi** | Admin permission |

---

## qb-doorlock

| Risk | Durum | Not |
|------|--------|-----|
| Kapı açma spoof (`sentSource`) | ✅ **düzeltildi** | Yalnızca `source` kullanılır |

---

## qb-ambulancejob

| Risk | Durum | Not |
|------|--------|-----|
| Armor/death metadata spoof | ✅ **düzeltildi** | Ölüm temizleme token; zırh clamp |
| EMS stash yetkisiz | ✅ **düzeltildi** | ambulance + on duty |
| `SendToBed` uzaktan / sahte yatak | ✅ **düzeltildi** | Index doğrulama + 15 m mesafe |
| Revive hunger reset spam | ✅ **düzeltildi** | 30 sn cooldown |
| Sahte revive (metadata) | ✅ **düzeltildi** | Sunucu token — yalnızca legit revive |
| EMS alert spam | ✅ **düzeltildi** | 30 sn cooldown + sanitize |
| Doctor sayacı spoof | ✅ **düzeltildi** | Job + on duty doğrulama |
| TreatWounds off duty | ✅ **düzeltildi** | on duty zorunlu |

---

## qb-garages

| Risk | Durum | Not |
|------|--------|-----|
| Başkasının aracını spawn | ✅ **düzeltildi** | `spawnvehicle` plaka sahiplik kontrolü |
| Stats/mods manipülasyonu | ✅ **düzeltildi** | Plaka sanitize + sahiplik + fuel/engine/body sınırı |
| Depot ödeme spoof | ✅ **düzeltildi** | Plaka sahiplik kontrolü |
| `syncGarage` config overwrite | ✅ **düzeltildi** | Yalnızca `type = house` birleştirme |

---

## Bilinçli açık / ertelenen

| Konu | Neden |
|------|--------|
| MySQL root | Teknik borç — prod'da `fivem` kullanıcısı |
| Anti-cheat | P4+ / açılış sonrası |
| Discord webhook log | Teknik borç |
| qb-adminmenu tam audit | QBCore varsayılan — ACE yeterli MVP için |

---

## Periyodik kontrol (açılış öncesi)

- [ ] Yeni `RegisterNetEvent` → sunucu doğrulama eklendi mi?
- [ ] Yeni ekonomi event → mesafe + fiyat sunucuda mı?
- [ ] `server.cfg` repoda yok mu?
- [ ] Whitelist açıkken ACE listesi güncel mi?

---

## İlgili dosyalar

| Resource | Sunucu dosyası |
|----------|----------------|
| rp-dealership | `server/main.lua` |
| rp-mileage | `server/main.lua` |
| rp-chat | `server/main.lua` |
| qb-multicharacter | `server.lua` |
| qb-garages | `server.lua` |
| qb-vehiclekeys | `server.lua` |
| qb-doorlock | `server.lua` |
