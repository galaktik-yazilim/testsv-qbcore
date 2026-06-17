# Araç Galerisi — LS Cars (rp-dealership)

## Özet

Şehirdeki tek resmi araç galerisi. `qb-vehicleshop` yerine hard RP'ye uygun sade bir arayüz kullanır.

## Kimler kullanabilir?

Tüm oyuncular (yeterli parası olan).

## Nasıl araç satın alınır?

1. Haritada **LS Cars** blip'ine gidin (PDM girişi yakını)
2. Yeşil marker'a yaklaşın
3. **`[E] LS Cars`** yazısı görününce `E` tuşuna basın
4. Katalogdan araç seçin, nakit veya banka ile ödeyin
5. Araç spawn noktasında oluşur; anahtar otomatik verilir
6. **Kontağı siz açarsınız** — motor otomatik çalışmaz

## Ödeme

| Yöntem | Açıklama |
|--------|----------|
| Nakit | Üzerinizdeki cash |
| Banka | Banka hesabı bakiyesi |

Fiyatlar QBCore `shared/vehicles.lua` içindeki `price` değerinden gelir.

## RP notları

- Galeride vitrin araçlarına binip satın alamazsınız — sadece marker'dan
- Satın alma sonrası plakayı RP'de kullanın
- Araç garajda `pillboxgarage` olarak kayıtlı başlar — `qb-garages` ile çekilir

## Teknik

| Alan | Değer |
|------|-------|
| Resource | `rp-dealership` |
| Config | `resources/[standalone]/rp-dealership/config.lua` |
| Galeri ID | `lscars` |
| Spawn | Config içindeki `spawn` koordinatı |

## Güvenlik

- Satın alma yalnızca galeri marker mesafesinde (6 m)
- Fiyat ve stok sunucu tarafında doğrulanır
- 3 saniye satın alma cooldown

## Sorun giderme

**Galeri açılmıyor:** Karakter yüklenene kadar bekleyin. Marker'a 2,5 m içinde olun.

**Para çekildi araç gelmedi:** F8 konsol hatası + sunucu log kontrol edin.
