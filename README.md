# testsv — FiveM QBCore (txAdmin)

QBCore tabanlı FiveM sunucusu. txAdmin `txData` klasör yapısına göre düzenlenmiştir.

## Klasör yapısı

```
txData/
├── default/                 # txAdmin profili (config takip edilir, runtime data ignore)
├── QBCore_2F0666.base/      # Sunucu kökü (server.cfg, resources)
├── admins.json              # txAdmin admin hesapları (YEREL — repoda yok)
└── scripts/                 # Yardımcı scriptler
```

## İlk kurulum (yeni makine / clone sonrası)

1. `server.cfg.example` → `QBCore_2F0666.base/server.cfg` kopyalayın, anahtarları doldurun.
2. `admins.json.example` → `admins.json` kopyalayın veya txAdmin üzerinden admin oluşturun.
3. MySQL veritabanını kurun (`mysql_connection_string` ile eşleşmeli).
4. Sunucuyu txAdmin üzerinden başlatın.

## Git stratejisi — veri kaybını önleme

| Takip edilir (Git) | Takip edilmez (yerel) |
|---|---|
| `resources/` kaynak kodu | `default/data/` oyuncu DB |
| `server.cfg.example` | `server.cfg` (license, MySQL) |
| `default/config.json` | `admins.json` |
| Resource config / lua dosyaları | `cache/`, `logs/`, `node_modules/` |

**Önemli:** `git checkout`, `git reset` veya büyük merge işlemlerinden **önce** yedek alın:

```powershell
.\scripts\backup-data.ps1
```

Yedekler `_backups/` altına gider (repoya dahil değil).

## GitHub'a yükleme

```powershell
cd C:\txData
git init          # zaten yapıldıysa atlayın
git add .
git status        # server.cfg ve admins.json listede OLMAMALI
git commit -m "Initial QBCore server setup"
git branch -M main
git remote add origin https://github.com/KULLANICI/REPO.git
git push -u origin main
```

Private repo oluşturmak için GitHub → New repository → **Private** seçin.

## Geliştirme notları

- Resource değişikliklerinden sonra sunucuda `ensure resource_adi` veya restart.
- Webpack/yarn gerektiren resource'lar (`screenshot-basic` vb.) ilk start'ta otomatik derlenir.
- `[qb]`, `[standalone]` gibi klasör adları FiveM'in resource gruplarıdır; köşeli parantez normaldir.
