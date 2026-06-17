# Adım 12 — UI & Chat Cila

> **Durum:** ✅ Kod tamamlandı  
> Oyuncu testi: chat çift mesaj, HUD hizası, galeri spawn

---

## Bu turda ne yaptık?

| Konu | Dosya |
|------|--------|
| Chat bildirimleri **2 kez** görünme fix | `rp-chat/client/notify.lua` — tek `chat:addMessage` yolu |
| HUD stat ikonları minimap ile hizalama | `qb-hud/html/styles.css` |
| Stat renkleri tek palet (kritikte kırmızı) | `qb-hud/html/styles.css`, `app.js` |
| Nakit kutusu yeşil kutu → stat satırı stili | `qb-hud/html/styles.css` |
| Chat pencere / yazı boyutu hafif büyütme | `rp-chat/style.css` |
| Galeri spawn — vitrin üstüne binme | `rp-dealership/config.lua`, `server/main.lua`, `client/main.lua` |
| HUD kemer ikonu yanlış toggle | `qb-hud/client.lua` — state parametresi |

---

## Neden?

- `SendChatLine` hem `TriggerEvent` hem `exports['chat']:addMessage` çağırıyordu → aynı notify iki satır.
- HUD ikonları minimap dikey ortasına göre hesaplanıyordu; farklı renkli kutular dağınık görünüyordu.
- PDM spawn noktası vitrin araçlarıyla çakışıyordu.

---

## Test et

- [ ] Araç satın al → başarı mesajı **1 kez**
- [ ] Kemer takılıyken inme uyarısı **1 kez**
- [ ] Sol alt stat satırı minimap ile hizada, tek renk tonu
- [ ] Chat yazıları biraz daha okunaklı (abartılı büyük değil)
- [ ] LS Cars satın alma → araç vitrin üstüne binmeden yan parka spawn

---

## Sonraki adım

[ADIM-04-Test-Cila.md](./ADIM-04-Test-Cila.md) → genel oyun içi test checklist
