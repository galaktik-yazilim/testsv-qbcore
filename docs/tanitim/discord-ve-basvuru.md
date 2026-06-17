# Discord ve Başvuru

> Kapalı beta ve açılış öncesi topluluk kurulumu.

---

## Discord sunucu yapısı (öneri)

| Kanal | Tür | Açıklama |
|-------|-----|----------|
| `#duyurular` | Sadece admin | Sunucu güncellemeleri |
| `#kurallar` | Sadece admin | [sunucu-kurallari.md](./sunucu-kurallari.md) + [evren-ve-dil.md](./evren-ve-dil.md) özeti |
| `#basvuru` | Herkes | Form linki + süreç |
| `#destek` | Herkes | Teknik sorunlar |
| `#genel-ooc` | Herkes | OOC sohbet |
| `#ic-duyuru` | Whitelist | IC duyurular (açılış sonrası) |

---

## Başvuru formu (Google Form — ücretsiz)

Form alanları önerisi:

1. Discord kullanıcı adı + ID
2. Yaş (18+ zorunlu)
3. FiveM / RP deneyimi (kısa)
4. Karakter adı + kısa hikaye (2–3 paragraf)
5. Hard RP kurallarını okudum (checkbox)
6. Los Santos evreni + metrik birimler (m/km) — arayüz Türkçe (checkbox / kısa not)
7. Rockstar license (isteğe bağlı — admin onayında txAdmin'den alınabilir)

Onay sonrası:
- Discord rolü: `Whitelist` / `Oyuncu`
- `server.cfg` ACE veya txAdmin whitelist

---

## server.cfg entegrasyonu

```
sets qb_discord "https://discord.gg/SUNUCU_INVITE"
```

Oyuncular qb-core Discord linkini görebilir (config bağlı).

---

## Whitelist akışı

```
Başvuru → Admin inceleme → Onay → ACE veya txAdmin whitelist → Oyuncu girer
```

ACE örneği:
```
add_principal identifier.license:abc123 group.whitelisted
```

---

## Açılış günü

1. `#duyurular` pin: IP, kurallar, `/kurallar` komutu
2. İlk saat: adminler online, `/911` ve chat test
3. Sorun kanalı: `#destek`

Detay: [ADIM-03-Acilis.md](../gelistirme/ADIM-03-Acilis.md)
