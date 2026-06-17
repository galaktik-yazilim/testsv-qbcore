# Adım 13 — Test Öncesi Stabilizasyon

> **Durum:** ✅ Kod tamamlandı  
> Oyuncu testi: galeri çift tık, giriş hatası, sessiz chat

---

## Bu turda ne yaptık?

| Konu | Dosya |
|------|--------|
| Giriş `SetMetaData` nil crash | `qb-multicharacter/server.lua` |
| Giriş hoş geldin chat spam kapatıldı | `rp-chat/config.lua` |
| Galeri çift satın alma koruması | `rp-dealership` server + client + NUI |
| Bekleyen spawn varken uyarı mesajı | `rp-dealership/server/main.lua` |
| Yeni karakter inside metadata temizliği | `qb-multicharacter/server.lua` |
| HUD legacy speed etiketi `km/s` | `qb-hud/html/styles.css` |

---

## Test et

- [ ] Giriş — konsolda `SetMetaData` hatası yok
- [ ] Giriş — chat'te otomatik hoş geldin yok
- [ ] Galeri — satın al'a çift tık → tek araç, tek ücret
- [ ] Galeri — işlem bitmeden tekrar al → uyarı mesajı

---

## Sonraki adım

[ADIM-04-Test-Cila.md](./ADIM-04-Test-Cila.md) — genel checklist
