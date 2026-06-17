# Sağlık Görevlisi (EMS)

## Özet

Acil tıp personeli. Yaralı oyunculara müdahale, hastane nakli ve tedavi RP'si yapar.

## Kimler oynayabilir?

- Whitelist onaylı EMS üyeleri
- `qb-ambulancejob` job'u `ambulance` olarak atanmış karakterler

## Temel görevler

- `/911` çağrılarına gitmek
- Yaralıyı stabilize etmek, hastaneye nakletmek
- Ölüm / downed durumunda hard RP prosedürü uygulamak

## Hard RP farkı

- **NPC hastane check-in kapalı** — self-revive yok (`MinimalDoctors = 0`)
- Ölüm süresi: **6 dakika**
- Hastane respawn envanter **silmez**
- `/me` ve `/do` ile muayene zorunlu

## RP örnekleri

**Olay yerinde:**
```
/me yaralıya diz çöker, nabzını kontrol eder.
/do Nabız zayıf, soluk alıyor.
/me turnikeyi çıkarıp pansuman uygular.
```

**Nakil:**
```
/me sedye üzerine hastayı sabitler.
Merhaba, ben EMS paramedik [isim]. Size yardım edeceğiz.
```

## Yasak davranışlar

- Sebepsiz revive (admin onayı olmadan)
- Savaş alanında "full heal" ile RP'yi atlamak
- PD ile koordine olmadan olay yerine silahlı müdahale

## Teknik

| Alan | Değer |
|------|-------|
| Resource | `qb-ambulancejob` |
| Job adı | `ambulance` |
| Harita | `hospital_map` |

## İleride eklenecek (P4+)

- Downed / injury state scripti
- Hastane kayıt RP'si
