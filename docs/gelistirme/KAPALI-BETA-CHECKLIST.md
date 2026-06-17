# Kapalı Beta Checklist

> Süre önerisi: **3–7 gün** · Oyuncu: **5–15 kişi**

---

## Başlamadan önce (admin)

- [ ] Sunucu restart edildi (Adım 01 + 02 değişiklikleri aktif)
- [ ] `resmon 1` — pma-voice / qb-radio **yok**, idle ms not edildi
- [ ] `server.cfg` anahtarları dolu, MySQL bağlantısı çalışıyor
- [ ] Whitelist açık (txAdmin veya `QBCore.Config.Server.Whitelist = true`)
- [ ] Beta oyuncu listesi Discord'da paylaşıldı
- [ ] [Sunucu kuralları](../tanitim/sunucu-kurallari.md) okundu / pinlendi

---

## Gün 1 — Temel akış

| # | Test | ✓ |
|---|------|---|
| 1 | Bağlantı + whitelist | |
| 2 | Karakter oluşturma (geçersiz isim reddi) | |
| 3 | Chat: normal, `/me`, `/do`, `/b`, `/s`, `/w` | |
| 4 | `/kurallar` | |
| 5 | Galeri `[E]` — araç al, kontak aç | |
| 6 | Garaj — araç çıkar / park et | |
| 7 | `/km` — çıktı **km** | |
| 8 | HUD — hız **km/s**, sayaç **km** | |

---

## Gün 2 — Acil servis & ekonomi

| # | Test | ✓ |
|---|------|---|
| 1 | PD on duty → sivil `/911` çağrı alır | |
| 2 | EMS on duty → `/911` çağrı alır | |
| 3 | Off duty PD → çağrı **almaz** | |
| 4 | 911 cooldown (60 sn) | |
| 5 | Başlangıç para + ATM | |

---

## Gün 3–7 — RP senaryoları

| # | Senaryo | ✓ |
|---|---------|---|
| 1 | Trafik durdurma (PD) — text RP | |
| 2 | Basit yaralanma + EMS müdahale | |
| 3 | OOC ihlal → admin müdahale prosedürü | |
| 4 | 30+ dk kesintisiz oyun — crash/lag var mı? | |
| 5 | 5+ oyuncu aynı bölgede — performans | |

---

## Bilinen sınırlamalar (MVP — normal)

- Voice chat yok (bilinçli)
- Telefon, konut, meslek NPC'leri yok
- Dispatch paneli yok — sadece `/911` text
- Yaralanma scripti yok — ambulance job temel

---

## Beta sonrası

- [ ] Geri bildirimler toplandı (Discord form / kanal)
- [ ] Chat mesafeleri / ekonomi gerekirse ayarlandı
- [ ] Kritik bug'lar giderildi
- [ ] Adım 03 (açılış) planlandı
