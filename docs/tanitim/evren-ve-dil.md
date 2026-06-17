# Evren, Dil ve Birimler

> Sunucunun “nasıl hissettirmesi gerektiği” — geliştirme ve RP kararlarında referans.

---

## Üç katman

| Katman | Ne? | Örnek |
|--------|-----|--------|
| **Evren (IC)** | Los Santos, San Andreas — **Amerika** | LSPD, Pillbox Hospital, $ USD |
| **Dil (OOC/UI)** | Arayüz, komut açıklamaları, dokümantasyon — **Türkçe** | `/me`, `/kurallar`, qb_locale `tr` |
| **Birimler** | Oyuncuya gösterilen mesafe/hız/km — **metrik** | metre, km, km/s |

**Türkiye’de geçmiyoruz.** Harita, şehir, para birimi ($), kurum isimleri GTA/Los Santos evrenindedir.

---

## Metrik birimler (oyuncuya yansıyan)

| Alan | Birim | Nerede |
|------|-------|--------|
| Chat mesafesi | **metre (m)** | Normal ~20m, `/s` ~3m, `/w` ~40m |
| Araç hızı (HUD) | **km/s** | `qb-hud` — `UseMPH = false` |
| Araç kilometresi | **km** | `/km`, HUD; DB iç hesap mil → ekranda km |
| Harita koordinatları | oyun birimi | `/911` — `Harita konumu X,Y` (sokak adı yok) |

Mil/miles **gösterilmez** (config: `rp-mileage` `DisplayMetricKm = true`).

---

## Dil

- Sunucu listesi, chat komutları, bildirimler: **Türkçe** (`setr qb_locale "tr"`)
- IC karakter **İngilizce konuşabilir** — chat’e İngilizce yazmak serbest (Los Santos evrenine uygun)
- OOC açıklamalar `/b` ile Türkçe veya İngilizce — tercih oyuncuda

---

## Karakter isimleri

Los Santos’ta yaşayan **gerçekçi** isimler:

| ✅ Uygun | ❌ Uygun değil |
|----------|----------------|
| James Miller | xX_DragonSlayer_Xx |
| Maria Santos | Test123 |
| Ahmet Yılmaz (göçmen RP) | Ünlü/meme isim |
| Jean-Pierre Dubois | Sembol, rakam |

Uyruk alanı IC’dir — `American`, `Mexican`, `Turkish` vb. seçilebilir.

---

## Para

- **USD ($)** — QBCore varsayılan
- Başlangıç: $150 nakit + $850 banka

---

## Geliştirici notu

Yeni özellik eklerken:

1. Mesafe/hız **metrik** mi?
2. Oyuncuya giden metin **Türkçe** mi?
3. IC dünya **Los Santos** ile çelişiyor mu?

Kapalı meslekler açılırken (ör. `qb-taxijob`) config'teki **mil/mile** fiyatlarını km/metrik mantığa çevirin.

İlgili config: `rp-chat/config.lua`, `rp-mileage/config.lua`, `qb-hud/config.lua`
