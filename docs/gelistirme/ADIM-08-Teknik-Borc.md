# Adım 08 — Teknik Borç

> **Durum:** ✅ Scriptler hazır — **en son** uygula (açılış + oyuncu varken anlamlı)  
> Detay listesi: [TEKNIK-BORC.md](../TEKNIK-BORC.md)

---

## Ne zaman?

- Sunucu stabil, beta/açılış geçti
- Veritabanında gerçek oyuncu verisi var
- Yedek kaybetmek istemiyorsun

---

## Sıra

### 1. MySQL güvenli kullanıcı

```powershell
# scripts/setup-mysql.sql içinde şifreyi değiştir
mysql -u root -p < scripts/setup-mysql.sql
```

`server.cfg`:
```
set mysql_connection_string "mysql://fivem:SIFRE@localhost/QBCore_2F0666?charset=utf8mb4"
```

### 2. Yedek test

```powershell
copy scripts\mysql.env.example scripts\mysql.env
# mysql.env doldur
.\scripts\backup-data.ps1
```

### 3. Günlük yedek (opsiyonel)

```powershell
.\scripts\install-daily-backup.ps1
```

### 4. Performans kaydı

Oyuncu varken F8 → `resmon 1` → [PERFORMANS-NOTLARI.md](./PERFORMANS-NOTLARI.md)

### 5. İnce ayar (isteğe bağlı)

- Discord webhook logları
- `sv_maxclients` slot testi
- OneSync ayarı

---

## Tur 08 bitti sayılır when

- [ ] `fivem` MySQL kullanıcısı prod'da
- [ ] En az 1 manuel yedek alındı
- [ ] resmon not edildi (veya bilinçli ertelendi)

---

## Tüm adımlar

| 08 | Teknik borç | Bu dosya + [TEKNIK-BORC.md](../TEKNIK-BORC.md) |
| Özet | [DURUM.md](./DURUM.md) | Tüm turlar |
