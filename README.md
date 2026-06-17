# testsv — FiveM QBCore (txAdmin)

QBCore tabanlı **hard RP / text-based** FiveM sunucusu. txAdmin `txData` klasör yapısına göre düzenlenmiştir.

## Dokümantasyon

| Dosya | İçerik |
|-------|--------|
| [docs/tanitim/README.md](docs/tanitim/README.md) | Oyuncu & geliştirici rehberleri (Türkçe) |
| [docs/ROADMAP.md](docs/ROADMAP.md) | Geliştirme yol haritası |
| [docs/gelistirme/README.md](docs/gelistirme/README.md) | Geliştirme adımları 01–03 |
| [docs/TODO.md](docs/TODO.md) | Operasyonel checklist (restart, beta) |
| [CHANGELOG.md](CHANGELOG.md) | Yapılan değişiklikler |

## Klasör yapısı

```
txData/
├── docs/                    # Yol haritası, TODO, tanıtım rehberleri
│   └── tanitim/             # Sistem & meslek rehberleri (Türkçe)
├── default/                 # txAdmin profili
├── QBCore_2F0666.base/      # Sunucu kökü (server.cfg, resources)
├── admins.json              # txAdmin admin hesapları (YEREL)
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
