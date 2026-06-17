# Genel İlerleme

> **Son güncelleme:** 2025-06-17 — Tur 17–20 kapanış paketi (kod tamam)  
> **Hedef:** MVP sunucunun kapalı beta → açılış yolu (P4+ backlog hariç)

---

## Özet

| Metrik | Oran | Durum |
|--------|------|--------|
| **Genel (açılışa kadar)** | **58%** | Kod/doc bitti · operasyon bekliyor |
| Kod & dokümantasyon | 100% | Turlar 01–22 ✅ |
| Operasyon (sen) | 0% | Test, beta, açılış, teknik borç ⏳ |
| P4+ büyüme (sonra) | 0% | Yalnızca plan 📋 |

### Genel progress bar

```
Açılışa kadar  ███████████░░░░░░░░░  58%
```

### Alt çubuklar

```
Kod & doc      ████████████████████  100%
Operasyon      ░░░░░░░░░░░░░░░░░░░░    0%
P4+ (backlog)  ░░░░░░░░░░░░░░░░░░░░    0%
```

---

## Milestone tablosu (toplam 100 puan)

| Puan | Aşama | Durum | Not |
|------|-------|-------|-----|
| 10 | Altyapı — explicit resource, voice kapalı, server.cfg | ✅ | ~32 resource |
| 10 | Karakter & ekonomi — 1 slot, validasyon, başlangıç $ | ✅ | ADIM-01 |
| 12 | Araç RP — chat, ignition, km, galeri, garaj | ✅ | ADIM-02–04 |
| 5 | PD/EMS + `/911` + whitelist altyapısı | ✅ | Testte whitelist kapalı |
| 5 | Güvenlik & performans denetimi | ✅ | [GUVENLIK-DENETIMI.md](./gelistirme/GUVENLIK-DENETIMI.md) |
| 8 | Geliştirme doc turları 01–08 | ✅ | [DURUM.md](./gelistirme/DURUM.md) |
| 3 | Evren / dil / metrik (Los Santos · TR · m/km) | ✅ | [evren-ve-dil.md](./tanitim/evren-ve-dil.md) |
| 2 | Komut rehberi + `/komutlar` | ✅ | [komutlar.md](./tanitim/komutlar.md) |
| 3 | Tanıtım + beta/açılış rehberleri hazır | ✅ | Discord, checklist |
| **58** | **Tamamlanan toplam** | | |
| 12 | Oyun içi test | ⏳ | [ADIM-04-Test-Cila.md](./gelistirme/ADIM-04-Test-Cila.md) |
| 18 | Kapalı beta (whitelist, 5–15 oyuncu) | ⏳ | [ADIM-05-Kapali-Beta.md](./gelistirme/ADIM-05-Kapali-Beta.md) |
| 10 | Açılış (Discord, duyuru, hostname) | ⏳ | [ADIM-07-Acilis.md](./gelistirme/ADIM-07-Acilis.md) |
| 2 | Teknik borç prod (MySQL user, yedek) | ⏳ | [ADIM-08-Teknik-Borc.md](./gelistirme/ADIM-08-Teknik-Borc.md) |
| **42** | **Kalan toplam** | | |

---

## Sırada ne var?

1. **Restart + oyun içi test** — checklist [TODO.md](./TODO.md) §1  
2. **Kapalı beta** — whitelist aç, 3–7 gün  
3. **Açılış** — Discord + duyuru  
4. **Teknik borç** — yedek / MySQL (en son)

P4+ (konut, telefon, injury): [ADIM-06-P4-Plan.md](./gelistirme/ADIM-06-P4-Plan.md) — açılış **sonrası**, genel yüzdeye **dahil değil**.

---

## Güncelleme günlüğü

| Tarih | Değişiklik | Yeni % |
|-------|------------|--------|
| 2025-06-17 | İlk progress dosyası; kod/doc tamamlandı sayıldı | **58%** |
| 2025-06-17 | +2 puan: komutlar.md + `/komutlar` | 58% *(tabloya eklendi)* |
| 2025-06-17 | Fix: loading takılması (apartments callback), doorlock TR locale | 58% |
| 2025-06-17 | Tur 10: yeni karakter NUI, `/fine` phone guard, spawn TR, verify script, PD alert guard | 58% |
| 2025-06-17 | Tur 11: Legion varsayılan spawn, inside metadata temizliği, qb-spawn guard | 58% |
| 2025-06-17 | Tur 12: chat çift mesaj fix, HUD/chat UI, galeri spawn | 58% |
| 2025-06-17 | Fix: multichar SetMetaData giriş hatası; hoş geldin chat kapatıldı | 58% |
| 2025-06-17 | Tur 13: galeri çift satın alma koruması, giriş stabilizasyonu | 58% |
| 2025-06-17 | Tur 14: `/disari`, qb-garages qb-fuel + mods kaydı | 58% |
| 2025-06-17 | Tur 15: HUD/dealership qb-fuel, garaj TR etiketleri, verify script genişletme | 58% |
| 2025-06-17 | Tur 16: EMS qb-fuel, garaj sunucu güvenliği, locale | 58% |
| 2025-06-17 | Tur 17–20: güvenlik, TR UI, preflight — **MVP kod kapanış** | 58% |
| 2025-06-17 | Tur 21: PD obje/alert, tüketim clamp, admin log guard | 58% |
| 2025-06-17 | Tur 22: HUD menü TR, log guard, heli spotlight, test rehberi | 58% |

---

## Nasıl güncellenir?

Her anlamlı iş bitince:

1. Milestone tablosunda ilgili satırı ✅ yap (veya kısmi ise puan böl)
2. **Tamamlanan / kalan** puanları yeniden topla
3. Progress bar blok sayısını güncelle: `round(yüzde / 5)` adet `█`, kalan `░` (20 blok = %100)
4. **Son güncelleme** tarihini ve günlük satırını ekle
5. [DURUM.md](./gelistirme/DURUM.md) özet satırına yeni % yaz

**Örnek — oyun içi test bitince:** +12 puan → **70%** → `██████████████░░░░░░`

**Örnek — beta bitince:** +18 puan → **88%**

**Örnek — açılış:** +10 puan → **98%** (teknik borç kalır)

**Örnek — teknik borç prod:** +2 puan → **100%**

---

## P4+ ayrı skor (isteğe bağlı)

Açılış sonrası büyüme; ana % ile karıştırma.

| P4+ madde | Durum |
|-----------|-------|
| Meslek ekonomileri | 📋 |
| Konut | 📋 |
| Yaralanma / injury | 📋 |
| Text SMS / minimal telefon | 📋 |
| Anti-cheat | 📋 |

P4+ progress: `░░░░░░░░░░░░░░░░░░░░` **0%** (planlandı, uygulanmadı)
