# Oyun İçi Test — Hızlı Rehber

> Restart öncesi: `.\scripts\preflight-server.ps1`  
> Tam checklist: [ADIM-04-Test-Cila.md](./ADIM-04-Test-Cila.md)

---

## 5 dakika smoke test

1. **Giriş** — hata yok, hoş geldin chat yok, Legion civarı spawn
2. **Chat** — T, `/me`, `/b`, `/kurallar`, `/komutlar` (tek satır notify)
3. **Araç** — LS Cars al → M kontak → K kilit → `/km` → Pillbox garaj
4. **HUD** — stat hizası, km/s, renkli barlar, menü Türkçe
5. **`/disari`** — interior'da dene (varsa)

## 15 dakika tam test

- [ ] Yeni karakter + kıyafet akışı
- [ ] Galeri çift satın alma yok
- [ ] Garaj park / çıkar / yakıt
- [ ] Banka veya ATM — arayüz Türkçe
- [ ] EMS veya PD (2. hesap): `/911`, on/off duty
- [ ] Admin: `/a test`

## Sorun bulursan

Not al: ne yaptın, ne oldu, F8 konsol hatası var mı.  
Kritik bug → düzeltme sonrası tekrar smoke test.

## Test bitince

[ILERLEME.md](../ILERLEME.md) → oyun içi test milestone **+12 puan → 70%**
