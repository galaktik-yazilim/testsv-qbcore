# Adım 04 — Test & Cila

> **Durum:** ✅ Tamamlandı (kod + güvenlik + dokümantasyon)  
> Oyun içi test: senin checklist'in — [aşağı](#senin-yapman-gereken--oyun-içi-test)

Adım 01–03 bitti. Bu adımda MVP'yi **oyun içinde test edip** küçük eksikleri kapatıyoruz. Whitelist kapalı kalır.

---

## Bu adımda ne yaptık?

| Konu | Dosya / değişiklik |
|------|---------------------|
| `/ame` — isimsiz eylem | `rp-chat` |
| `/a` — admin global duyuru | `rp-chat` (admin yetkisi) |
| `/ooc` kaldırıldı | `qb-core` → yerel OOC: `/b` |
| `/km` — araç kilometresi | `rp-mileage` |
| NPC temizliği (PDM / Ammunation) | `qb-smallresources`, `rp-dealership` |
| CK / PK / MGK tanımları | `sunucu-kurallari.md` |
| Güvenlik denetimi + düzeltmeler | [GUVENLIK-DENETIMI.md](./GUVENLIK-DENETIMI.md) |
| Performans ince ayarı | ignition/dealership Wait optimizasyonu |
| Evren/dil/birim standardı | [evren-ve-dil.md](../tanitim/evren-ve-dil.md), HUD km/s, `/kurallar` |
| Loading takılması fix | `qb-multicharacter` — apartments callback guard |
| Tur 10 giriş/PD | Yeni karakter NUI, `/fine` phone guard — [ADIM-10](./ADIM-10-Giris-PD-Cila.md) |
| Tur 11 spawn | Legion varsayılan, inside metadata — [ADIM-11](./ADIM-11-Spawn-Dis-Guvenlik.md) |
| Tur 12 UI | Chat çift mesaj, HUD, galeri spawn — [ADIM-12](./ADIM-12-UI-Cila.md) |
| Tur 13 | Giriş fix, hoş geldin kapalı, galeri çift tık — [ADIM-13](./ADIM-13-Stabilizasyon.md) |
| Tur 14 | `/disari`, garaj qb-fuel, mods kaydı — [ADIM-14](./ADIM-14-Garaj-Interior.md) |
| Tur 15 | HUD/dealership qb-fuel, garaj TR, verify script — [ADIM-15](./ADIM-15-MVP-Cila.md) |

---

## Senin yapman gereken — oyun içi test

Whitelist **kapalı** — herkes girebilir. Sırayla dene:

### Temel akış
- [ ] Restart → hata yok
- [ ] Karakter olu (1 slot, geçersiz isim reddi)
- [ ] **Yeni karakter** akışı → kıyafet ekranı açılır, karakter menüsü geri gelmez
- [ ] Chat: normal, `/me`, `/ame`, `/do`, `/b`, `/s`, `/w`
- [ ] `/kurallar`
- [ ] LS Cars → araç al → kontak → garaj
- [ ] Araçtayken `/km` — çıktı **km** biriminde
- [ ] HUD: hız **km/s**, kilometre **km** (mil/mph yok)
- [ ] `/kurallar` — Los Santos + metrik satırı görünür
- [ ] `/komutlar` — genel liste + footer (tam liste linki)
- [ ] Giriş sonrası chat'te otomatik `» Hoş geldin` satırları **gelmemeli**
- [ ] Loading ekranı Los Santos / text RP metinleri

### Evren / birimler
- [ ] Chat mesafeleri hissedilir (~20m normal, `/w` daha geniş)
- [ ] Para birimi $ (USD)

### PD / EMS (2. hesap veya arkadaş)
- [ ] PD on duty → sivil `/911` alır
- [ ] Off duty → `/911` gitmez
- [ ] EMS ölüm / respawn (envanter korunur)

### Admin
- [ ] `/a test duyurusu` — herkes görür

### NPC
- [ ] PDM / Ammunation çevresinde clerk NPC yok

Test notlarını buraya veya Discord'a yaz. Sorun varsa düzelt, sonra Adım 05.

---

## Adım 05'e geçiş kriteri

- [ ] Yukarıdaki checklist'in çoğu ✓
- [ ] Kritik bug yok
- [ ] İsteğe bağlı: 2–3 kişiyle kısa RP oturumu

Sonra: whitelist aç, kapalı beta checklist, Discord.

---

## Sonraki adımlar (plan)

| Adım | Konu |
|------|------|
| **05** | Kapalı beta | [ADIM-05-Kapali-Beta.md](./ADIM-05-Kapali-Beta.md) |
| **06** | P4+ plan | [ADIM-06-P4-Plan.md](./ADIM-06-P4-Plan.md) |
| **Teknik borç** | [TEKNIK-BORC.md](../TEKNIK-BORC.md) |

---

## Tüm adımlar

| Adım | Konu | Dosya |
|------|------|-------|
| 01 | MVP temel | [ADIM-01-MVP-Temel.md](./ADIM-01-MVP-Temel.md) |
| 02 | Kapalı beta prep | [ADIM-02-Kapali-Beta.md](./ADIM-02-Kapali-Beta.md) |
| 03 | Açılış altyapısı | [ADIM-03-Acilis.md](./ADIM-03-Acilis.md) |
| 04 | Test & cila | [ADIM-04-Test-Cila.md](./ADIM-04-Test-Cila.md) |
| 05–08 | Beta → açılış → borç | [DURUM.md](./DURUM.md) |
