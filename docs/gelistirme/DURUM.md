# Geliştirme Durumu — Özet

> **MVP kod geliştirmesi (Tur 01–26) tamamlandı — TEST HAZIR.**  
> Kalan işler **operasyonel** (test, beta, açılış, teknik borç).

**Genel ilerleme (açılışa kadar): 58%** → [ILERLEME.md](../ILERLEME.md)

Son güncelleme: Tur 25 test hazırlık — **restart + test**

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
| [13](./ADIM-13-Stabilizasyon.md) | Stabilizasyon | ✅ | ✅ | Giriş + galeri çift tık |
| [14](./ADIM-14-Garaj-Interior.md) | Garaj & `/disari` | ✅ | ✅ | Garaj park/çıkar |
| [15](./ADIM-15-MVP-Cila.md) | MVP son cila | ✅ | ✅ | Yakıt HUD, verify script |
| [16](./ADIM-16-EMS-Garaj-Guvenlik.md) | EMS & garaj güvenlik | ✅ | ✅ | EMS araç, garaj exploit |
| [17–20](./ADIM-17-20-Kapanis-Paketi.md) | Kapanış paketi | ✅ | ✅ | Preflight, TR UI, güvenlik |
| [21](./ADIM-21-PD-Tuketim-Guvenlik.md) | PD & tüketim güvenlik | ✅ | ✅ | PD obje, banka TR |
| [22](./ADIM-22-UI-Guvenlik-Cila.md) | UI & güvenlik cilası | ✅ | ✅ | HUD TR, log guard |
| [23](./ADIM-23-Metadata-Guvenlik.md) | Metadata güvenlik | ✅ | ✅ | Kelepçe, revive token |
| [24](./ADIM-24-PD-EMS-Sertlestirme.md) | PD/EMS sertleştirme | ✅ | ✅ | Off duty guard |
| [25](./ADIM-25-Test-Hazirlik.md) | Test hazırlık & finalize | ✅ | ✅ | test-oncesi.ps1 |
| [26](./ADIM-26-Otomasyon-Whitelist.md) | Whitelist ACE otomasyon | ✅ | ✅ | enable-beta-mode.ps1 |

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
