# Aktif TODO — Operasyonel

> **MVP finalize (Tur 01–26) bitti.**   Test için hazırsın.  
> Master özet: [gelistirme/DURUM.md](./gelistirme/DURUM.md)  
> **İlerleme: 58%** → [ILERLEME.md](./ILERLEME.md)

---

```
Genel ilerleme       ███████████░░░░░░░░░  58%
Geliştirme (kod)     ████████████████████ 100%  (Tur 01–26)
Oyun içi test         ⏳ sen
Kapalı beta           ⏳ test sonrası
Açılış                ⏳ beta sonrası
Teknik borç           ⏳ en son
P4+ (konut, telefon)  📋 backlog — ADIM-06
```

---

## 1. Oyun içi test (şimdi)

**Önce:** `.\scripts\setup-dev-env.ps1` → restart

[TEST-ONCESI-FINAL.md](./gelistirme/TEST-ONCESI-FINAL.md) · [OYUN-ICI-TEST-HIZLI.md](./gelistirme/OYUN-ICI-TEST-HIZLI.md) · [ADIM-04-Test-Cila.md](./gelistirme/ADIM-04-Test-Cila.md)

Test bitince: [TEST-SONRASI.md](./gelistirme/TEST-SONRASI.md)

- [ ] Restart
- [ ] Karakter, chat, `/km`, galeri, garaj
- [ ] **Tur 12:** notify/chat tek satır; HUD hizası; galeri spawn vitrin üstüne binmiyor
- [ ] **Tur 15:** garaj TR etiketleri; HUD yakıt; verify script tam kontrol
- [ ] **Tur 16:** EMS araç yakıtı; garaj park/depot normal
- [ ] **Yeni karakter** → Legion Meydanı civarında açık alanda spawn
- [ ] HUD km/s + km; `/kurallar` evren satırı
- [ ] LS Cars → araç al → **Pillbox Garajı** park / çıkar
- [ ] Interior'da **`/disari`**
- [ ] Garaj menüsü / blip etiketleri Türkçe (**Açık Otopark**, **Pillbox Garajı**)
- [ ] Araç yakıt HUD hatasız (qb-fuel)
- [ ] `.\scripts\preflight-server.ps1` — tam kontrol OK
- [ ] **Tur 21:** PD off duty stash kapalı; banka ekstre TR
- [ ] **Tur 22:** HUD menü TR; PD heli spotlight off duty kapalı
- [ ] **Tur 23:** Kelepçe/revive metadata; EMS off duty işlem yok
- [ ] **Tur 24:** PD off duty arama/ceza; respawn guard; envanter tüketim

---

## 2. Kapalı beta

[ADIM-05-Kapali-Beta.md](./gelistirme/ADIM-05-Kapali-Beta.md) · [KAPALI-BETA-CHECKLIST.md](./gelistirme/KAPALI-BETA-CHECKLIST.md)

- [ ] Whitelist aç → `.\scripts\enable-beta-mode.ps1` (ACE otomatik)
- [ ] 3–7 gün, 5–15 oyuncu
- [ ] [BETA-GERI-BILDIRIM.md](./gelistirme/BETA-GERI-BILDIRIM.md) topla

---

## 3. Açılış

[ADIM-07-Acilis.md](./gelistirme/ADIM-07-Acilis.md)

- [ ] Discord, duyuru, hostname
- [ ] Kurallar pin

---

## 4. Teknik borç (en son)

[ADIM-08-Teknik-Borc.md](./gelistirme/ADIM-08-Teknik-Borc.md)

---

## Referans

| Dosya | |
|-------|---|
| [ROADMAP.md](./ROADMAP.md) | Vizyon & fazlar |
| [GUVENLIK-DENETIMI.md](./gelistirme/GUVENLIK-DENETIMI.md) | Güvenlik |
| [oyuncu-hizli-referans.md](./tanitim/oyuncu-hizli-referans.md) | Oyuncu özeti |
| [ILERLEME.md](../ILERLEME.md) | Genel ilerleme (%58) |
| [komutlar.md](./tanitim/komutlar.md) | Komut rehberi · `/komutlar` |
