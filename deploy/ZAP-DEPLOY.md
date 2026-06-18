# ZAP + txAdmin deploy

## Tek recipe URL (asla silme, asla degistirme)

```
https://raw.githubusercontent.com/galaktik-yazilim/testsv-qbcore/main/deploy/recipe.yaml
```

GitHub'a push edince ayni URL otomatik guncel recipe'yi ceker. txAdmin'de recipe **silip yeniden ekleme** — bu tam deploy tetikler ve DB/cfg bozulur.

---

## Gunluk guncelleme (10–20 test)

1. Lokalde kod → `git push`
2. txAdmin → sunucu ana sayfa → **Run Recipe** (Deployer kurulumu degil)
3. **Restart**

Recipe sadece `resources/` indirir. **MySQL'e ve server.cfg'ye dokunmaz.**

---

## Ilk kurulum (bir kez)

`recipe-install.yaml` — sadece bos sunucuda:

```
https://raw.githubusercontent.com/galaktik-yazilim/testsv-qbcore/main/deploy/recipe-install.yaml
```

Canli sunucuda **bir daha calistirma**.

---

## server.cfg (bir kez ayarla, txAdmin'de kalir)

Settings → FXServer → `server.cfg`:

- `set mysql_connection_string "mysql://..."` — ZAP MySQL panelinden
- `sv_licenseKey "cfxk-..."` — CFX key

`{{dbConnectionString}}` veya `{{svLicense}}` literal kalmamali.

---

## DB neden sifirlanmis gibi gorunur?

| Yaparsan | Sonuc |
|----------|--------|
| Recipe sil + yeniden Deployer kurulumu | Sunucu sifir, cfg/DB baglantisi kaybolur |
| `recipe-install` canlida tekrar | SQL tekrar (genelde veri silmez ama risk) |
| `{{dbConnectionString}}` kalan cfg | Baska/bos DB'ye baglanir — karakterler yok |
| ZAP sunucu reset | MySQL silinebilir |

**Karakterler ZAP MySQL'de durur.** Recipe dosyalari gunceller, DB silmez.

Deploy oncesi ZAP phpMyAdmin → Export yedek al (aliskanlik).

---

## Recipe validation hatasi (server.cfg)

Guncelleme recipe cfg yazmaz. `server.cfg` txAdmin'de zaten varsa sorun olmamali. Yoksa Settings → FXServer'den `deploy/server.cfg.template` icerigini yapistir (MySQL + license doldur).

---

## Asla yapma

- Recipe URL silip bastan Deployer
- Canlida `recipe-install.yaml`
- ZAP panelden sunucu reset (MySQL dahil)
