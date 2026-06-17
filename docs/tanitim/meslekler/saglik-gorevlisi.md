# Sağlık Görevlisi (EMS)

## Özet

Acil tıp personeli. Yaralı oyunculara müdahale, hastane nakli ve tedavi RP'si yapar.

## Kimler oynayabilir?

- Whitelist onaylı EMS üyeleri
- `qb-ambulancejob` job'u `ambulance` olarak atanmış karakterler

## Temel görevler

- 911 / sağlık çağrılarına gitmek
- Yaralıyı stabilize etmek, hastaneye nakletmek
- Ölüm / downed durumunda hard RP prosedürü uygulamak

## Hard RP farkı

Bu sunucuda **hızlı self-revive** ve arcade tedavi hedeflenmez. Yaralanma ciddiye alınır:

- `/me` ile muayene yapın
- `/do` ile tespit yazın
- Gerekirse hastane RP'si uzatılır

> **Planlanan:** Gelişmiş yaralanma sistemi — şu an temel `qb-ambulancejob` aktif.

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

## Komutlar

Resource: `qb-ambulancejob` — revive, sedye, hastane noktaları config'de.

## Yasak davranışlar

- Sebepsiz revive (admin onayı olmadan)
- Savaş alanında "full heal" ile RP'yi atlamak
- PD ile koordine olmadan olay yerine silahlı müdahale

## Teknik

| Alan | Değer |
|------|-------|
| Resource | `qb-ambulancejob` |
| Job adı | `ambulance` |
| Harita | `hospital_map` (pillbox hastane) |

## İleride eklenecek

- Downed / injury state
- `/911` text dispatch
- Hastane kayıt RP'si
