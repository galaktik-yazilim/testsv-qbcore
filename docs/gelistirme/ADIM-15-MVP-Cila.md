# Adım 15 — MVP Son Cila Paketi

> **Durum:** ✅ Kod tamamlandı  
> Oyuncu testi: yakıt HUD, garaj etiketleri, verify script

---

## Bu turda ne yaptık?

| Konu | Dosya |
|------|--------|
| **qb-hud** yakıt: `qb-fuel` öncelikli (`LegacyFuel` fallback) | `qb-hud/client.lua` |
| **rp-dealership** satın alma yakıtı: `qb-fuel` öncelik | `rp-dealership/client/main.lua` |
| Garaj blip/etiketleri Türkçe (Açık Otopark, Polis, TIR, tekne vb.) | `qb-garages/config.lua` |
| Yeni karakter (apartments dalı): inside metadata temizliği | `qb-multicharacter/server.lua` |
| **`/disari`** sunucu doğrulama (geçersiz source guard) | `rp-chat/server/stuck.lua` |
| **`/kurallar`** interior kurtarma satırı | `rp-chat/config.lua`, `sunucu-kurallari.md` |
| **verify-server-cfg.ps1** — yasak + zorunlu MVP ensure kontrolü | `scripts/verify-server-cfg.ps1` |

---

## Test et

- [ ] Araçtayken HUD yakıt göstergesi / düşük yakıt uyarısı hata vermiyor
- [ ] LS Cars satın alma sonrası yakıt dolu
- [ ] Haritada garaj blip'leri **Açık Otopark** / **Pillbox Garajı** vb. Türkçe
- [ ] `.\scripts\verify-server-cfg.ps1` — hem yasak hem zorunlu satırlar OK
- [ ] `/kurallar` — `/disari` satırı görünür

---

## Sonraki adım

Oyun içi test checklist → [ADIM-04-Test-Cila.md](./ADIM-04-Test-Cila.md) · test bitince **+12 puan → 70%**
