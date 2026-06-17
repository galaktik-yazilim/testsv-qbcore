# Güvenlik Denetimi — rp-* & MVP

> Son güncelleme: Adım 04–05 turu  
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

---

## qb-multicharacter (MVP)

| Risk | Durum | Not |
|------|--------|-----|
| Client isim/yaş bypass | ✅ | Sunucu validasyonu |
| Slot aşımı | ✅ | COUNT + max 1 |
| Yanlış slot (cid) | ✅ **düzeltildi** | Yalnızca `cid = 1` |
| Başkasının karakteri | ✅ | `QBCore.Player.Login` license eşleşmesi |
| Oyuncu silme | ✅ | `EnableDeleteButton = false` |

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
