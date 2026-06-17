# Test Sonrası — Ne Yapılır?

> Oyun içi testi bitirdikten sonra bu adımları uygula.

---

## Test geçtiyse (kritik bug yok)

1. [ILERLEME.md](../ILERLEME.md) → oyun içi test milestone **+12 puan → 70%**
2. [TODO.md](../TODO.md) §1 maddelerini `[x]` işaretle
3. Not al: küçük UI sorunları, RP önerileri → [BETA-GERI-BILDIRIM.md](./BETA-GERI-BILDIRIM.md)

---

## Kapalı beta (sıradaki operasyon)

```powershell
.\scripts\enable-beta-mode.ps1
```

Detay: [ADIM-05-Kapali-Beta.md](./gelistirme/ADIM-05-Kapali-Beta.md)

---

## Bug bulduysan

Her bug için not:
- Ne yaptın?
- Ne oldu / ne olmalıydı?
- F8 konsol hatası var mı?

Kritik (giriş, ekonomi, exploit) → düzelt → smoke test tekrar.  
Kozmetik (yazım, hizalama) → beta sırasında toplanabilir.

---

## Açılış (beta sonrası)

[ADIM-07-Acilis.md](./ADIM-07-Acilis.md) — Discord, duyuru, hostname → **+10 puan → 98%**

---

## Teknik borç (en son)

[ADIM-08-Teknik-Borc.md](./ADIM-08-Teknik-Borc.md) — MySQL user, yedek, resmon → **+2 puan → 100%**
