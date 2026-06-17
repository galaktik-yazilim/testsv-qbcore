# Adım 01 — MVP Temel (Karakter & Ekonomi)

> **Hedef:** Güvenli, sade, oynanabilir giriş deneyimi. Gelişmiş sistem yok.  
> **Durum:** ✅ Kod tamamlandı — sunucu tarafında restart gerekir.

---

## Bu adımda ne yaptık?

| Değişiklik | Neden |
|------------|--------|
| **1 karakter slotu** | Hard RP: tek kimlik |
| **Sunucu tarafı isim/yaş doğrulama** | Client bypass exploit kapatıldı |
| **Karakter silme kapalı** | CK yalnızca admin prosedürü |
| **Düşük başlangıç parası** (150$ + 850$ banka) | Arcade ekonomi değil |
| **İşsiz maaş = 0** | Bedava para yok |
| **Maaş döngüsü 60 dk** | Spam gelir yok |
| **`loadHouseData` guard** | `qb-houses` kapalıyken gereksiz SQL yok |

---

## Güvenlik kontrol listesi (bu adım)

- [x] `createCharacter`: sunucu validasyonu (isim, yaş, cinsiyet, uyruk)
- [x] Karakter limiti sunucuda zorlanıyor (client'a güvenilmiyor)
- [x] `loadUserData`: citizenid tip kontrolü (qb-core zaten license doğrular)
- [x] `deleteCharacter`: kapalı + citizenid tip kontrolü
- [x] İsimde rakam / injection karakterleri reddediliyor
- [x] Minimum yaş 18 (config'den ayarlanabilir)

---

## Senin yapman gerekenler (sırayla)

### 1. server.cfg oluştur / güncelle

PowerShell (txData kökünden):

```powershell
cd C:\txData\QBCore_2F0666.base
if (-not (Test-Path server.cfg)) {
    Copy-Item server.cfg.example server.cfg
    Write-Host "server.cfg olusturuldu — ANAHTARLARI DOLDURUN."
} else {
    Write-Host "server.cfg zaten var — ensure listesini example ile karsilastirin."
}
```

`server.cfg` içinde doldur:
- `sv_licenseKey`
- `mysql_connection_string`
- `steam_webApiKey`
- Admin `identifier.fivem:...`

**Asla** gerçek key'leri Git'e commit etme.

### 2. MySQL güvenliği

> Teknik borç — şimdilik root ile devam. Detay: [TEKNIK-BORC.md](../TEKNIK-BORC.md)

```sql
CREATE USER 'fivem'@'localhost' IDENTIFIED BY 'GUCLU_SIFRE_BURAYA';
GRANT SELECT, INSERT, UPDATE, DELETE ON veritabani_adi.* TO 'fivem'@'localhost';
FLUSH PRIVILEGES;
```

Connection string:
```
mysql://fivem:GUCLU_SIFRE_BURAYA@localhost/veritabani_adi?charset=utf8mb4
```

### 3. Sunucuyu restart et

txAdmin → Restart. Konsolda hata olmamalı.

### 4. Test checklist (5 dk)

| # | Test | Beklenen |
|---|------|----------|
| 1 | Sunucuya gir | Multichar açılır, **1 slot** |
| 2 | Karakter oluştur: `Test123` isim | **Reddedilir** |
| 3 | Geçerli isim + 18+ yaş | Karakter oluşur |
| 4 | F8 → `resmon 1` | Idle scriptler düşük ms |
| 5 | Chat `/me test` | Proximity chat çalışır |
| 6 | Galeri `[E]` | Sadece marker'dan açılır |

### 5. Whitelist (kapalı beta için — opsiyonel)

`qb-core/config.lua`:
```lua
QBCore.Config.Server.Whitelist = true
```

`server.cfg` — oyuncuya admin yetkisi ver (test için):
```
add_principal identifier.license:XXXX group.admin
```

Prod'da txAdmin whitelist tercih edilir.

---

## Performans notu

`qb-multicharacter` artık her girişte `houselocations` sorgusu **yapmaz** (`qb-houses` kapalı). Gereksiz SQL kaldırıldı.

---

## Sonraki adım

**Adım 02:** Sunucu kuralları metni + kapalı beta checklist + basit `/911` chat komutu (dispatch paneli değil).

Dosya: `docs/gelistirme/ADIM-02-Kapali-Beta.md` (henüz oluşturulmadı)

---

## Değişen dosyalar

- `resources/[qb]/qb-core/config.lua`
- `resources/[qb]/qb-core/shared/jobs.lua`
- `resources/[qb]/qb-multicharacter/config.lua`
- `resources/[qb]/qb-multicharacter/server.lua`
