# Zap Hosting — MySQL / oxmysql

**Hazır cfg:** [`server.cfg.zap`](./server.cfg.zap) — MySQL ve license dolu. txAdmin → Settings → FXServer → içeriği yapıştır → Save → Restart.

(Bu dosya `.gitignore`'da — şifre repoya gitmez.)

## Belirti

```
Ignoring invalid configuration option: {{dbConnectionString}}
Unable to establish a connection to the database (ECONNREFUSED)
```

`server.cfg` içinde `{{dbConnectionString}}` **literal** kalmış demektir — txAdmin placeholder'ı doldurmamış.

## Neden olur?

| Durum | Açıklama |
|--------|----------|
| **Güncelleme recipe** (`recipe.yaml`) | Bilerek `server.cfg` üzerine yazmaz; MySQL satırını değiştirmez |
| **Eski v1.1.2 recipe** | `replace_string` boş değişkenle DB satırını silmiş olabilir |
| **Şablon kopyalandı, doldurulmadı** | İlk deploy'da txAdmin adım 2 atlanmış veya recipe-install yerine sadece update çalıştırılmış |

**Güncelleme recipe'si bu hatayı otomatik çözmez** — canlı `server.cfg`'yi Zap panelinden düzenlemen gerekir.

## Zap'ta düzeltme (5 dk)

1. **Zap panel** → MySQL / MariaDB → bağlantı bilgilerini kopyala:
   - Host (ör. `mysql-mariadb-21-104.zap-srv.com`)
   - Port (`3306`)
   - Kullanıcı adı
   - Şifre
   - Veritabanı adı

2. **txAdmin** → **Settings** → **FXServer** → `server.cfg` düzenle.

3. Şu satırı gerçek bağlantı ile değiştir:

```cfg
set mysql_connection_string "mysql://KULLANICI:SIFRE@HOST:3306/VERITABANI?charset=utf8mb4"
```

Örnek:

```cfg
set mysql_connection_string "mysql://zap1391637-1:GucluSifre@mysql-mariadb-21-104.zap-srv.com:3306/zap1391637-1?charset=utf8mb4"
```

4. Aynı dosyada `sv_licenseKey` satırının da `{{svLicense}}` **içermediğinden** emin ol — CFX key olmalı.

5. **Save** → sunucuyu **Restart**.

6. Konsolda `oxmysql` hatası kaybolmalı; `ensure qb-core` sonrası DB sorguları çalışır.

## Sıfırdan kurulum (ileride)

Tam kurulum için **İlk Kurulum** recipe'sini kullan (`recipe-install.yaml`):

- Deployer adım 2: CFX license + MySQL bilgileri
- `replace_string` ile `{{dbConnectionString}}` otomatik dolar
- SQL tabloları import edilir

Günlük kod güncellemesi için **Güncelleme** recipe (`recipe.yaml`) yeterli — DB/cfg'ye dokunmaz.

## Yerel geliştirme

Yerelde `QBCore_2F0666.base/server.cfg` (git'e girmez) içinde:

```cfg
set mysql_connection_string "mysql://root:@localhost/QBCore_2F0666?charset=utf8mb4"
```

`.\scripts\verify-server-cfg.ps1` placeholder kontrolü yapar.
