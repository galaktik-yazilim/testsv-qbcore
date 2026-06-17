# Araç Kilometresi (rp-mileage)

## Özet

Sahiplendiğiniz araçların toplam kilometresi veritabanında saklanır. Hard RP'de araç değeri, bakım ve satış senaryolarında kullanılabilir.

## Kimler kullanabilir?

Araç sahipleri (sürücü koltuğunda sürerken km artar).

## Nasıl çalışır?

- Sürücü koltuğunda ve hız > 1 km/h iken km sayacı artar
- Veritabanına ~10 saniyede bir senkronize edilir
- Bisiklet, tekne, helikopter, uçak sayılmaz

## Oyuncu için

Araçtayken **`/km`** yazarak plaka ve kilometresini chat'te görebilirsiniz.

```
/km
» Araç: ABC123 — 84.3 km
```

RP'de de `/me` + `/do` ile kullanılabilir:

```
/me kilometre sayacına bakar.
/do Araç 84.320 km gösteriyor.
```

## Teknik

| Alan | Değer |
|------|-------|
| Resource | `rp-mileage` |
| DB kolonu | `player_vehicles.drivingdistance` (FLOAT) |
| Export | `exports['rp-mileage']:GetMileage(plate)` |

## Güvenlik

Client'tan gelen km artışı sunucuda doğrulanır: sürücü koltuğu, plaka eşleşmesi, max delta ve dakika başına sync limiti.
