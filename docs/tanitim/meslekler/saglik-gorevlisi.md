# Sağlık Görevlisi (EMS)

## Özet

Acil tıp personeli (**Pillbox Hill Medical Center** / EMS). Yaralı oyunculara müdahale, hastane nakli ve tedavi RP'si yapar.

## Kimler oynayabilir?

- Whitelist onaylı EMS üyeleri
- `qb-ambulancejob` job'u `ambulance` olarak atanmış karakterler

## Temel görevler

- `/911` çağrılarına gitmek
- Yaralıyı stabilize etmek, hastaneye nakletmek
- Ölüm / downed durumunda hard RP prosedürü uygulamak

## Hard RP farkı

- **NPC hastane check-in kapalı** — self-revive yok (`MinimalDoctors = 0`)
- **Görevde değilken** revive, bandaj, doktor sayacı ve EMS stash **kapalı** (script korumalı)
- Ölüm süresi: **6 dakika**
- Hastane respawn envanter **silmez**
- `/me` ve `/do` ile muayene zorunlu

## Hastane akışı (script değil prosedür)

1. Sivil `/911` gönderir
2. EMS on duty çağrıyı alır, olay yerine gider
3. Olay yerinde `/me` + `/do` müdahale
4. Gerekirse hastaneye nakil RP'si
5. Ölüm durumunda: 6 dk bekleme → EMS müdahalesi veya hastane respawn
6. **Self-revive yok** — NPC check-in kapalı

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
