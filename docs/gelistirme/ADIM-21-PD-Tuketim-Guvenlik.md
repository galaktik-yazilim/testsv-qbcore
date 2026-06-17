# Adım 21 — PD & Tüketim Güvenliği

> **Durum:** ✅ Kod tamamlandı  
> Oyuncu testi: PD obje/spike, banka ortak hesap, açlık/susuzluk

---

## Bu turda ne yaptık?

| Konu | Dosya |
|------|--------|
| PD obje / spike / silme: LEO + görevde | `qb-policejob/server/objects.lua` |
| PD stash / çöp / delil: görevde kontrolü | `qb-policejob/server/main.lua` |
| PD alert: 30 sn cooldown + metin sınırı | `qb-policejob/server/main.lua` |
| Açlık/susuzluk: 0–100 clamp | `qb-smallresources/server/consumables.lua` |
| Tackle: mesafe kontrolü | `qb-smallresources/server/main.lua` |
| Sunucu logları: yalnızca admin | `qb-multicharacter/server.lua` |
| Banka ekstre metinleri Türkçe | `qb-banking` server + NUI |
| Keybind açıklamaları TR | `qb-smallresources` client |

---

## Test et

- [ ] PD görevde değilken spike/obje spawn **olmaz**
- [ ] PD off duty → stash açılmaz
- [ ] Banka ortak hesap aç → ekstre **İlk yatırma** Türkçe
- [ ] Ayarlar menüsünde keybind açıklamaları Türkçe

---

## Sonraki adım

[ADIM-04-Test-Cila.md](./ADIM-04-Test-Cila.md) · [preflight](../../scripts/preflight-server.ps1)
