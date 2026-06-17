# Genel Başlangıç

## Sunucu türü

Bu proje **hard roleplay**, **text-based** (yazı tabanlı) bir FiveM sunucusudur. Sesli konuşma ikincil plandadır; iletişim chat üzerinden yapılır.

## İlk kurulum (sunucu sahibi)

1. `QBCore_2F0666.base/server.cfg.example` dosyasını `server.cfg` olarak kopyalayın
2. `sv_licenseKey`, `mysql_connection_string`, `steam_webApiKey` değerlerini doldurun
3. MySQL veritabanını oluşturup QBCore SQL şemasını import edin
4. txAdmin üzerinden sunucuyu başlatın
5. `resmon 1` ile boş sunucuda performans ölçümü yapın

**Önemli:** `server.cfg` ve `admins.json` repoda takip edilmez — asla GitHub'a yüklemeyin.

## Oyuncu olarak ilk giriş

1. Sunucuya bağlanın
2. Karakter oluşturun (`qb-multicharacter`)
3. Gerçekçi isim kullanın (ör. `Ahmet Yılmaz` — meme isimler yasak)
4. Chat penceresi her zaman görünür — `T` ile yazın

## Temel RP kuralları

| Kural | Açıklama |
|-------|----------|
| IC / OOC ayrımı | Karakter içi = IC. OOC için `/b` kullanın |
| Powergaming | Gerçekte yapamayacağınız eylemi yazmayın |
| Metagaming | OOC öğrendiğiniz bilgiyi IC kullanmayın |
| Fear RP | Tehdit altındayken mantıklı davranın |
| NLRP | New Life — ölümden sonra olayı unutursunuz (sunucu kuralına göre) |

## Chat komutları (özet)

| Komut | Mesafe | Kullanım |
|-------|--------|----------|
| `T` + mesaj | ~20m | Normal konuşma |
| `/me eylem` | ~20m | Karakter eylemi |
| `/do ortam` | ~20m | Ortam açıklaması |
| `/s mesaj` | ~3m | Fısıltı |
| `/w mesaj` | ~40m | Bağırma |
| `/b mesaj` | ~20m | Yerel OOC |

Detay: [rp-chat.md](./sistemler/rp-chat.md)

## Araç kullanımı (özet)

- Motor **otomatik çalışmaz** — kontağı siz açarsınız
- Anahtarınız olmayan aracı çalıştıramazsınız
- Kilometre takibi yapılır

Detay: [rp-ignition.md](./sistemler/rp-ignition.md), [rp-mileage.md](./sistemler/rp-mileage.md)

## Para ve banka

- Nakit ve banka bakiyeniz HUD'da görünür
- Araç satın alma: [rp-dealership.md](./sistemler/rp-dealership.md)
- ATM ve banka: şehirdeki banka noktaları (`qb-banking`)

## Yardım

- Sistem rehberleri: [README.md](./README.md)
- Geliştirme planı: [ROADMAP.md](../ROADMAP.md)
