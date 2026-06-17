# Adım 11 — Spawn & Dış Mekân Güvenliği

> **Durum:** ✅ Kod tamamlandı  
> Oyuncu geri bildirimi: binadan çıkamama / havaalanında takılma

---

## Bu turda ne yaptık?

| Konu | Dosya |
|------|--------|
| Varsayılan spawn **Legion Meydanı** (açık alan) | `qb-core/config.lua`, `qb-multicharacter/config.lua` |
| Eski `inside` metadata temizliği (konut/apart kapalıyken) | `qb-multicharacter/server.lua` |
| Spawn seçimi: houses/apartments guard, nil-safe metadata | `qb-spawn/client.lua` |
| Eski LSIA koordinatlı karakter → Legion yönlendirme | `qb-multicharacter/server.lua` |
| Hoş geldin + takılma ipucu | `rp-chat/config.lua` |
| Oyuncu rehberi | `docs/tanitim/oyuncu-hizli-referans.md` |

---

## Neden?

- Eski **havaalanı (LSIA)** spawn noktası kapalı terminal içindeydi; yeni oyuncular çıkış bulmakta zorlanıyordu.
- `qb-apartments` / `qb-houses` kapalıyken DB’de kalan **inside metadata** oyuncuyu hayalet iç mekâna atabiliyordu.
- `qb-spawn` “son konum” seçiminde apartman event’i guard’sız tetikleniyordu.

---

## Test et

- [ ] **Yeni karakter** → kıyafet sonrası **Legion Meydanı** civarında, açık alanda
- [ ] **Mevcut karakter** giriş → spawn OK (son konum veya Legion)
- [ ] Spawn ekranında **Legion Meydanı** seç → dışarıda doğ
- [ ] Eski karakter (havaalanı koordinatlı) → çık-gir + Legion seç → sıkışma yok

---

## Sonraki adım

[ADIM-04-Test-Cila.md](./ADIM-04-Test-Cila.md) → kapalı beta
