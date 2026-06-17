# Adım 02 — Kapalı Beta Hazırlığı

> **Hedef:** Kurallar, `/911` text dispatch, ses altyapısı kaldırma  
> **Durum:** ✅ Kod tamamlandı — restart gerekir

---

## Bu adımda ne yaptık?

| Değişiklik | Neden |
|------------|--------|
| **pma-voice + qb-radio kaldırıldı** | Text RP; CPU/RAM/bant genişliği tasarrufu |
| **`/911` komutu** | PD/EMS'e text çağrı (panel yok) |
| **`/kurallar` komutu** | Oyuncuya chat'te kural özeti |
| **Sunucu kuralları dokümanı** | `docs/tanitim/sunucu-kurallari.md` |
| **Beta checklist** | `docs/gelistirme/KAPALI-BETA-CHECKLIST.md` |

---

## Güvenlik (`/911`)

- [x] Mesaj sanitizasyonu (256 karakter, HTML strip)
- [x] **60 sn** cooldown (spam önleme)
- [x] Yalnızca `police` / `ambulance` job + **on duty** alır
- [x] Konum yalnızca X,Y (tam koordinat leak minimum)
- [x] Görevde personel yoksa çağrı gitmez (troll DB yükü yok)

---

## Performans (voice kaldırma)

Kaldırılan resource'lar:
- `pma-voice` — native audio, proximity voice thread
- `qb-radio` — radio NUI + pma bağımlılığı

**Not:** `[voice]` klasörü diskte kalır ama **start edilmez**. İleride ihtiyaç olursa `server.cfg`'ye tekrar eklenebilir.

Aktif resource'larda pma-voice referansı:
- `qb-phone` — kapalı (start edilmiyor)
- `qb-hud` — event dinler ama pma yokken hata vermez (event hiç tetiklenmez)

---

## Test checklist

| # | Test | Beklenen |
|---|------|----------|
| 1 | Restart sonrası `resmon 1` | pma-voice / qb-radio listede **yok** |
| 2 | `/kurallar` | Chat'te kural satırları |
| 3 | Sivil `/911 yardım` — PD yok | "Görevde acil personel yok" |
| 4 | PD on duty `/911` test (2. oyuncu) | PD chat'te `[911]` görür |
| 5 | 60 sn içinde 2. `/911` | Cooldown uyarısı |
| 6 | Voice tuşu | Hiçbir şey olmamalı (voice kapalı) |

---

## Kapalı beta başlatma

1. [KAPALI-BETA-CHECKLIST.md](./KAPALI-BETA-CHECKLIST.md) dosyasını takip et
2. Whitelist aç (txAdmin veya `qb-core` config)
3. 3–7 gün, 5–15 oyuncu
4. Geri bildirim topla → Adım 03 (açılış)

---

## Sonraki adım

**Adım 03:** Discord + başvuru formu + günlük MySQL yedek + açılış

---

## Değişen dosyalar

- `server.cfg`, `server.cfg.example`
- `resources/[standalone]/rp-chat/config.lua`
- `resources/[standalone]/rp-chat/server/main.lua`
- `docs/tanitim/sunucu-kurallari.md`
