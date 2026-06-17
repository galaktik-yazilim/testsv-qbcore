# Geliştirme Durumu — Özet

> **Kod ve dokümantasyon turları (01–08) tamamlandı.**  
> Kalan işler **operasyonel** (senin sunucuda yapacağın adımlar).

**Genel ilerleme (açılışa kadar): 58%** → [ILERLEME.md](../ILERLEME.md)

Son güncelleme: Tur 12 UI & chat cila

---

## Evren standardı

Oyuncuya yansıyan: **Los Santos (Amerika)**, arayüz **Türkçe**, birimler **metrik** (m, km, km/s).  
Referans: [tanitim/evren-ve-dil.md](../tanitim/evren-ve-dil.md)

---

## Tur durumu

| Tur | Konu | Kod | Doc | Operasyon (sen) |
|-----|------|-----|-----|-----------------|
| [01](./ADIM-01-MVP-Temel.md) | MVP temel | ✅ | ✅ | Restart, DB import |
| [02](./ADIM-02-Kapali-Beta.md) | Voice, /911, kurallar | ✅ | ✅ | — |
| [03](./ADIM-03-Acilis.md) | Whitelist altyapısı | ✅ | ✅ | Discord link |
| [04](./ADIM-04-Test-Cila.md) | Chat/km, güvenlik | ✅ | ✅ | Oyun içi test |
| [05](./ADIM-05-Kapali-Beta.md) | Beta süreci | ✅ | ✅ | Whitelist aç, beta |
| [06](./ADIM-06-P4-Plan.md) | P4+ backlog | — | ✅ | Açılış sonrası |
| [07](./ADIM-07-Acilis.md) | Açılış | ✅ | ✅ | Discord, duyuru |
| [08](./ADIM-08-Teknik-Borc.md) | Yedek, MySQL, resmon | ✅ script | ✅ | Prod'da kur |
| [09](./ADIM-09-Beta-Oncesi-Cila.md) | Beta öncesi cila | ✅ | ✅ | Test ile doğrula |
| [10](./ADIM-10-Giris-PD-Cila.md) | Giriş & PD cila | ✅ | ✅ | Yeni karakter + `/fine` test |
| [11](./ADIM-11-Spawn-Dis-Guvenlik.md) | Spawn & dış mekân | ✅ | ✅ | Legion spawn doğrula |
| [12](./ADIM-12-UI-Cila.md) | UI & chat cila | ✅ | ✅ | Chat/HUD/galeri test |

---

## Aktif resource listesi (~32)

`server.cfg.example` explicit ensure — voice, arcade, qb-shops, qb-phone kapalı.

Custom: `rp-chat`, `rp-ignition`, `rp-mileage`, `rp-dealership`  
Oyuncu komut rehberi: [komutlar.md](../tanitim/komutlar.md) · oyun içi `/komutlar`

---

## Güvenlik

[GUVENLIK-DENETIMI.md](./GUVENLIK-DENETIMI.md) — son turda denetlendi, kritik açık yok.

---

## Şimdi ne yapmalısın?

1. [ADIM-04](./ADIM-04-Test-Cila.md) — oyun içi test
2. [ADIM-05](./ADIM-05-Kapali-Beta.md) — whitelist + beta
3. [ADIM-07](./ADIM-07-Acilis.md) — açılış
4. [ADIM-08](./ADIM-08-Teknik-Borc.md) — en son

Operasyon checklist: [TODO.md](../TODO.md)

---

## P4+ (bilinçli ertelendi)

Konut, telefon, taşımacılık, injury, anti-cheat → [ADIM-06-P4-Plan.md](./ADIM-06-P4-Plan.md)

Bunlar **tur 06 backlog**; MVP açılışından sonra ihtiyaç halinde.
