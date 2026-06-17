# Text RP Chat (rp-chat)

## Özet

Sunucunun iletişim omurgasıdır. Global chat yoktur; tüm konuşmalar **yakınlık mesafesine** göre duyulur. Hard RP sunucularında olduğu gibi eylemler chat üzerinden yazılır.

## Kimler kullanabilir?

Tüm oyuncular.

## Komutlar

| Komut | Mesafe | Örnek | Açıklama |
|-------|--------|-------|----------|
| `T` + yazı | 20 m | `Merhaba.` | Normal IC konuşma |
| `/me` | 20 m | `/me cebinden cüzdanını çıkarır.` | Karakter eylemi |
| `/ame` | 20 m | `/ame cebine uzanır.` | İsimsiz eylem (`* mesaj`) |
| `/do` | 20 m | `/do Cüzdan eski görünüyor.` | Ortam / nesne durumu |
| `/s` | 3 m | `/s gel buraya.` | Fısıltı |
| `/w` | 40 m | `/w POLİS!` | Bağırma |
| `/b` | 20 m | `/b lag var.` | Yerel OOC — `(( isim ))` formatında |
| `/911` | PD/EMS | `/911 silahlı şüpheli` | Acil çağrı (60 sn cooldown) |
| `/kurallar` | — | `/kurallar` | Kural özeti |
| `/a` | Global | `/a sunucu 5 dk bakımda` | Admin duyuru (yalnızca admin) |

> `/ooc` kapatıldı — yerel OOC için `/b` kullanın.

## RP örnekleri

**Doğru:**
```
/me aracın kapısını yavaşça açar.
/do Kapı gıcırtıyla açılır.
Merhaba, yardım edebilir miyim?
```

**Yanlış:**
```
/araba kullanır  ← böyle komut yok, /me kullanın
(( IC'de konuşurken OOC yazmak ))  ← OOC için /b kullanın
```

## Araç ile ilgili otomatik mesajlar

Başka scriptler chat'e otomatik mesaj gönderir:

- Motor çalıştırma / durdurma (`rp-ignition`)
- Araç kilitleme (`qb-vehiclekeys`)
- Emniyet kemeri (`qb-smallresources`)

Bu mesajları sadece **sürücü koltuğunda** ve cooldown süresi dolduktan sonra tetiklenir.

## Bildirimler

QBCore bildirimleri (hata, başarı) chat'e yönlendirilir. Ekranda popup yerine chat'te `!`, `✓` prefix'li mesaj görürsünüz.

## Güvenlik & limitler

- Mesaj max **256 karakter**
- Komutlar arası **1,5 sn** cooldown (spam önleme)
- Araç aksiyonları **800 ms** cooldown
- HTML/format exploit filtrelenir

## Teknik (geliştirici)

| Alan | Değer |
|------|-------|
| Resource | `rp-chat` |
| Config | `resources/[standalone]/rp-chat/config.lua` |
| `/me` | qb-core'dan kaldırıldı; yalnızca rp-chat'te |

Mesafe değerlerini `config.lua` içinden değiştirebilirsiniz.

## /911 acil çağrı

Text-based dispatch — panel yok. Görevdeki `police` ve `ambulance` job'ları chat'te `[911]` mesajı alır.

```
/911 kavga var, yardım edin
```

- 60 saniye cooldown
- Konum yaklaşık X,Y olarak gönderilir
- Görevde (on duty) personel yoksa çağrı iletilmez

Detay: [sunucu-kurallari.md](../sunucu-kurallari.md)
