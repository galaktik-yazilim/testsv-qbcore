# vMenu kurulumu (admin / geliştirme)

vMenu, FiveM için popüler bir **admin trainer menüsüdür** (araç spawn, teleport, hava, oyuncu yönetimi vb.). Bu repoda **paket olarak gelmez** — ayrı indirilip sunucuya eklenir.

Hard RP sunucusunda **qb-adminmenu** zaten var. vMenu genelde **sunucu sahibi / geliştirici** işleri için kullanılır (test, event hazırlığı, hızlı teleport). Normal oyunculara açmayın.

Resmi dokümantasyon: https://docs.vespura.com/vmenu/

---

## 1. İndirme ve klasör

1. https://github.com/TomGrobbe/vMenu/releases — en güncel **`vMenu-*.zip`** dosyasını indir.
2. Zip içeriğini şuraya aç:
   ```
   QBCore_2F0666.base/resources/[standalone]/vMenu/
   ```
3. Klasör adı **tam olarak `vMenu`** olmalı (büyük/küçük harf duyarlı).  
   Yanlış: `resources/vMenu/vMenu/` veya `resources/vmenu/`

**Zap Hosting:** txAdmin / Zap panelinde vMenu için **1-click install** varsa onu da kullanabilirsin; sonrasında yine `permissions.cfg` ve tuş çakışmalarını aşağıdaki gibi düzenle.

---

## 2. server.cfg

`permissions.cfg` **ensure satırından önce** çalıştırılmalı:

```cfg
# --- vMenu (opsiyonel — admin/geliştirme) ---
exec @vMenu/config/permissions.cfg
ensure vMenu
```

Mevcut admin ACE satırlarının **altına** veya `permissions.cfg` içine kendi identifier'ını ekle (örnek):

```cfg
add_principal identifier.fivem:19207962 group.admin
```

Identifier bulmak: sunucuya gir → txAdmin → Players → kendi kaydın → `license:`, `fivem:` veya `discord:` değerlerinden birini kullan.

---

## 3. Sunucuya özel ayarlar (zorunlu)

vMenu varsayılan tuşları bu projeyle **çakışır**. Kurulumdan sonra `resources/[standalone]/vMenu/config/permissions.cfg` dosyasını düzenle:

| vMenu varsayılan | Bizde kullanım | Öneri |
|------------------|----------------|--------|
| `M` — menü aç | `M` — kontak (rp-ignition) | `F10` veya `HOME` |
| `F2` — noclip | `F2` — telefon (qb-phone) | Kapat veya `F6` gibi boş tuş |

`permissions.cfg` içinde örnek:

```cfg
setr vmenu_menu_staff_only true
setr vmenu_menu_toggle_key "F10"
setr vmenu_noclip_toggle_key "F6"
```

Staff grubuna menü izni (dosyada genelde `group.admin` / `group.moderator` zaten tanımlıdır):

```cfg
add_ace group.admin "vMenu.Staff" allow
```

### Ses (text RP)

Sunucuda voice kapalı. vMenu ses menüsünü **devre dışı bırak**: `permissions.cfg` içindeki **VOICE CHAT OPTIONS MENU** bölümünü tamamen sil (dosyadaki yorumda da böyle yazıyor). Böylece vMenu voice chat'e dokunmaz.

---

## 4. qb-adminmenu ile fark

| | qb-adminmenu | vMenu |
|---|--------------|--------|
| Açılış | QBCore admin yetkisi | ACE + `vMenu.Staff` |
| Kullanım | Moderasyon (kick, ban, job) | Trainer (spawn, hava, teleport, ped) |
| Kim | Admin/mod | Sadece sunucu sahibi / dev |

İkisini birlikte kullanabilirsin; oyunculara vMenu izni verme.

---

## 5. Oyunda kullanım

1. Sunucuya admin yetkisiyle gir.
2. **`F10`** (veya seçtiğin tuş) — vMenu ana menü açılır.
3. **Ok tuşları** — gezinme · **Enter** — seç · **Backspace** — geri · **ESC** — menüyü kapat.
4. Sık kullanılan bölümler:
   - **Online Players** — oyuncu listesi, teleport, freeze
   - **Player Options** — can, zırh, görünmezlik (izinlere bağlı)
   - **Vehicle Spawner** — test aracı (Hard RP’de canlıya açma)
   - **World Options** — hava, saat (test için)
   - **Misc Settings** — noclip, hız çarpanı (admin)

Menü açılmıyorsa: konsolda `ensure vMenu` hatası var mı bak; `exec @vMenu/config/permissions.cfg` satırının **ensure vMenu** üstünde olduğunu doğrula; identifier’ının `group.admin` içinde olduğunu kontrol et.

---

## 6. Restart

```
ensure vMenu
```

veya tam sunucu restart.

---

## 7. Doğrulama

- [ ] Klasör adı `vMenu`
- [ ] `exec` + `ensure` sırası doğru
- [ ] `vmenu_menu_toggle_key` ≠ M, `vmenu_noclip_toggle_key` ≠ F2
- [ ] `vmenu_menu_staff_only true`
- [ ] Voice chat bölümü permissions.cfg’den kaldırıldı
- [ ] Normal oyuncu menüyü açamıyor
