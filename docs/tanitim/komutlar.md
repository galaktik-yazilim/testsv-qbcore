# Oyun İçi Komutlar

> **Los Santos** evreni · **Türkçe** arayüz · **Metrik** birimler  
> Oyun içi kısa özet: **`/komutlar`** (meslek/admin bölümleri yetkiye göre)  
> Aktif kaynaklar: `server.cfg` / `server.cfg.example` (~32 resource)

Helper text formatı (F8 / chat önerisi stili):

```
/komut [argüman] — Açıklama
  argüman: Parametre açıklaması
```

---

## Sohbet & roleplay (`rp-chat`)

| Komut | Helper text |
|-------|---------------|
| `T` + yazı | Yakındakilere IC konuşma (~20 m) — komut değil, chat girişi |
| `/me` | `/me <mesaj>` — Yakındakilere eylem mesajı gönder · `mesaj`: Mesajınız |
| `/ame` | `/ame <mesaj>` — İsimsiz eylem mesajı (yakın) · `mesaj`: Mesajınız |
| `/do` | `/do <mesaj>` — Ortam eylemi belirt · `mesaj`: Mesajınız |
| `/b` | `/b <mesaj>` — Yakındaki oyunculara OOC mesaj gönder · `mesaj`: Mesajınız |
| `/s` | `/s <mesaj>` — Fısıldayarak konuş (~3 m) · `mesaj`: Mesajınız |
| `/w` | `/w <mesaj>` — Bağırarak konuş (~40 m) · `mesaj`: Mesajınız |
| `/911` | `/911 <mesaj>` — Acil servislere text çağrı gönder (PD / EMS) · `mesaj`: Acil durum açıklaması |
| `/kurallar` | Sunucu RP kurallarını göster (chat özeti) |
| `/komutlar` | Oyun içi komut listesi (kısa özet) |
| `/a` | `/a <mesaj>` — Admin duyurusu (tüm sunucu) · `mesaj`: Duyuru metni · **admin** |

> `/ooc` kapatıldı — yerel OOC için `/b` kullanın.

---

## Tuşlar (komut değil)

| Tuş | Açıklama |
|-----|----------|
| `M` | Kontak aç/kapa (`rp-ignition`) — motor otomatik çalışmaz |
| `K` | Araç kilidi (`qb-vehiclekeys`) |
| `L` | Emniyet kemeri (`qb-smallresources`) |
| `E` | Galeri / kapı / etkileşim noktaları (bağlama göre) |

---

## Araç & genel

| Komut | Helper text |
|-------|---------------|
| `/km` | Bulunduğun aracın kilometresini göster (`rp-mileage`) |
| `/givekeys` | `/givekeys [id]` — Anahtarları birine ver. ID yoksa en yakındaki veya araçtaki herkese · `id`: Oyuncu ID |
| `/job` | İşinizi kontrol edin |
| `/gang` | Çetenizi kontrol edin |
| `/id` | Check Your ID # — Sunucu ID numaranızı gösterir (`qb-smallresources`) |
| `/givecash` | `/givecash <id> <amount>` — Yakındaki oyuncuya nakit ver · `id`: Oyuncu ID · `amount`: Miktar |

---

## Polis — LSPD (`qb-policejob`)

**Job:** `police` · Görevde (`onduty`) olmayı unutmayın.

| Komut | Helper text |
|-------|---------------|
| `/cuff` | Oyuncuyu Kelepçele (Sadece Polis) |
| `/sc` | Normal Kelepçe (Sadece Polis) |
| `/escort` | Oyuncuyu Taşı |
| `/jail` | Oyuncuyu Hapse Gönder (Sadece Polis) |
| `/unjail` | `/unjail <id>` — Oyuncuyu Hapisten Çıkar · `id`: Oyuncu ID |
| `/fine` | `/fine <id> <amount>` — Ceza yaz · `id`: Oyuncu ID · `amount`: Tutar |
| `/seizecash` | Nakite Elkoy (Sadece Polis) |
| `/callsign` | `/callsign <name>` — Kendinize çağrı numarası verin · `name`: Çağrı adı |
| `/spikestrip` | Çivili şerit yerleştir (Sadece Polis) |
| `/pobject` | `/pobject <type>` — Nesne yerleştir/sil · `type`: Nesne türü |
| `/impound` | Bir araca el koy (Sadece Polis) |
| `/depot` | `/depot <price>` — Fiyatlı el koyma · `price`: Ücret |
| `/flagplate` | `/flagplate <plate> <reason>` — Plakayı işaretle · `plate`: Plaka · `reason`: Sebep |
| `/unflagplate` | `/unflagplate <plate>` — Plaka işaretini kaldır |
| `/plateinfo` | `/plateinfo <plate>` — Plaka sorgula |
| `/clearcasings` | Etraftaki boş kovanları temizle |
| `/clearblood` | Etraftaki kanları temizle |
| `/takedna` | `/takedna <id>` — DNA örneği al · `id`: Oyuncu ID |
| `/anklet` | Takip cihazı tak (Sadece Polis) |
| `/ankletlocation` | `/ankletlocation <cid>` — Takip cihazı konumu · `cid`: Vatandaş ID |
| `/cam` | `/cam <camid>` — Güvenlik kamerası · `camid`: Kamera ID |
| `/grantlicense` | `/grantlicense <id> <license>` — Lisans ver |
| `/revokelicense` | `/revokelicense <id> <license>` — Lisans iptal |
| `/takedrivinglicense` | Ehliyete el koy (Sadece Polis) |
| `/paytow` | `/paytow <id>` — Çekiciye ödeme |
| `/paylawyer` | `/paylawyer <id>` — Avukata ödeme |
| `/911p` | `/911p [mesaj]` — Polis iç çağrı / tutanak · `mesaj`: Gönderilecek mesaj |

Sivil acil çağrı: **`/911`** (`rp-chat`).

---

## Sağlık — EMS (`qb-ambulancejob`)

**Job:** `ambulance` · Görevde olmayı unutmayın.

| Komut | Helper text |
|-------|---------------|
| `/status` | Oyuncunun sağlığını kontrol et |
| `/heal` | Oyuncuyu iyileştir |
| `/revivep` | Oyuncuyu canlandır (EMS) |
| `/911e` | `/911e <mesaj>` — EMS raporu / iç çağrı · `mesaj`: Gönderilecek mesaj |

### Admin / god (EMS resource)

| Komut | Helper text |
|-------|---------------|
| `/revive` | `/revive [id]` — Oyuncuyu canlandır (Admin) |
| `/aheal` | `/aheal [id]` — Oyuncuyu iyileştir (Admin) |
| `/setpain` | `/setpain [id]` — Ağrı seviyesi ayarla (Admin) |
| `/kill` | `/kill [id]` — Oyuncuyu öldür (Admin) |

Sivil acil çağrı: **`/911`** (`rp-chat`).

---

## Yönetici — QBCore (`qb-core`)

| Komut | Helper text |
|-------|---------------|
| `/tp` | `/tp <id\|x> [y] [z]` — Oyuncuya veya koordinatlara TP · **admin** |
| `/tpm` | İşaret noktasına TP · **admin** |
| `/car` | `/car <model>` — Araç spawn et · **admin** |
| `/dv` | Aracı sil · **admin** |
| `/dvall` | Tüm araçları sil · **admin** |
| `/dvp` | Tüm pedleri sil · **admin** |
| `/dvo` | Tüm objeleri sil · **admin** |
| `/givemoney` | `/givemoney <id> <tip> <miktar>` — Para ver · **admin** |
| `/setmoney` | `/setmoney <id> <tip> <miktar>` — Para ayarla · **admin** |
| `/setjob` | `/setjob <id> <job> <grade>` — İş ata · **admin** |
| `/setgang` | `/setgang <id> <gang> <grade>` — Çete ata · **admin** |
| `/addpermission` | Oyuncuya yetki ver (god) |
| `/removepermission` | Oyuncudan yetki al (god) |
| `/openserver` | Sunucuyu herkes için aç · **admin** |
| `/closeserver` | Sunucuyu yetkisizlere kapat · **admin** |
| `/togglepvp` | PVP modunu aç/kapat · **admin** |

---

## Yönetici — Admin menü (`qb-adminmenu`)

| Komut | Helper text |
|-------|---------------|
| `/admin` | Yönetici menüsünü aç |
| `/announce` | `/announce <mesaj>` — Sunucu duyurusu |
| `/report` | `/report <mesaj>` — Yöneticiye rapor gönder |
| `/reportr` | `/reportr <id> <mesaj>` — Rapora yanıt ver |
| `/staffchat` | `/staffchat <mesaj>` — Personel sohbeti |
| `/warn` | `/warn <id> <sebep>` — Oyuncuyu uyar |
| `/checkwarns` | `/checkwarns <id> [no]` — Uyarıları kontrol et |
| `/delwarn` | `/delwarn <id> <no>` — Uyarı sil |
| `/noclip` | Hayalet modunu aç/kapat |
| `/blips` | Haritada oyuncu işaretçileri |
| `/names` | Baş üstü isim gösterimi |
| `/coords` | Koordinat geliştirici gösterimi |
| `/admincar` | Aracı garajınıza kaydet |
| `/maxmods` | Mevcut aracı maksimum modifiye et |
| `/kickall` | Tüm oyuncuları at |
| `/setmodel` | `/setmodel <model> [id]` — Ped modeli değiştir |
| `/setspeed` | Oyuncu yürüme hızı (fast / normal) |
| `/setammo` | `/setammo <miktar>` — Cephane ayarla |
| `/reporttoggle` | Gelen raporları aç/kapat |
| `/givenuifocus` | NUI odağı ver |
| `/vector2` | vector2 panoya kopyala |
| `/vector3` | vector3 panoya kopyala |
| `/vector4` | vector4 panoya kopyala |
| `/heading` | Bakış açısını panoya kopyala |

---

## Yönetici — Diğer aktif resource'lar

### Envanter (`qb-inventory`)

| Komut | Helper text |
|-------|---------------|
| `/giveitem` | `/giveitem <id> <item> <amount>` — Eşya ver · **admin** |
| `/clearinv` | `/clearinv [id]` — Envanter temizle · **admin** |
| `/randomitems` | Rastgele eşya al (test) |

### Karakter (`qb-multicharacter`)

| Komut | Helper text |
|-------|---------------|
| `/logout` | Karakterden çıkış yap · **admin** |
| `/closeNUI` | Multi karakter NUI kapat |
| `/deletechar` | `/deletechar <citizenid>` — Karakter sil (CK) · **admin** |

### Anahtar (`qb-vehiclekeys`)

| Komut | Helper text |
|-------|---------------|
| `/addkeys` | `/addkeys <id> <plate>` — Araç anahtarı ekle · **admin** |
| `/removekeys` | `/removekeys <id> <plate>` — Anahtar kaldır · **admin** |

### Kapı (`qb-doorlock`)

| Komut | Helper text |
|-------|---------------|
| `/newdoor` | Kapı kilidine yeni kapı ekle · **admin** |
| `/doordebug` | Debug modu aç/kapat · **admin** |

### Hava & zaman (`qb-weathersync`)

| Komut | Helper text |
|-------|---------------|
| `/weather` | `/weather <tip>` — Havayı değiştir · **admin** |
| `/time` | `/time <saat> <dakika>` — Zamanı ayarla · **admin** |
| `/freezetime` | Zamanı dondur / çöz · **admin** |
| `/freezeweather` | Dinamik hava değişimini aç/kapat · **admin** |
| `/blackout` | Karartma modu · **admin** |
| `/morning` | Saati 09:00 yap · **admin** |
| `/noon` | Saati 12:00 yap · **admin** |
| `/evening` | Saati 18:00 yap · **admin** |
| `/night` | Saati 23:00 yap · **admin** |

### Küçük kaynaklar (`qb-smallresources`)

| Komut | Helper text |
|-------|---------------|
| `/resetarmor` | Yeleği sıfırla (Polis) |
| `/resetparachute` | Paraşütü sıfırla |
| `/testwebhook` | Discord webhook test · **god** |

---

## Bilinçli kapalı (bu sunucuda yok)

Aşağıdaki komutlar repoda olabilir ancak **`server.cfg` listesinde ensure edilmez** — MVP dışı:

`qb-phone`, `qb-shops`, `qb-houses`, `qb-taxijob`, `qb-vehicleshop`, `qb-crypto`, soygun scriptleri, voice komutları vb.

---

## Güncelleme notu

Yeni komut eklerken:

1. Resource'ta `QBCore.Commands.Add(..., help, ...)` helper text'ini **Türkçe** yazın
2. Bu dosyayı ve `rp-chat` → `Config.CommandHelp` listesini güncelleyin
3. [CHANGELOG.md](../../CHANGELOG.md) kaydı ekleyin

İlgili: [oyuncu-hizli-referans.md](./oyuncu-hizli-referans.md) · [evren-ve-dil.md](./evren-ve-dil.md)
