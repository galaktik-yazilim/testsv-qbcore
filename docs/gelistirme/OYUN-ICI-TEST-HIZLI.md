# Oyun İçi Test — Hızlı Rehber

> **Tüm geliştirmeler (Tur 01–24) bitti — tek seferde test et.**  
> Restart öncesi: `.\scripts\preflight-server.ps1`  
> Tam checklist: [ADIM-04-Test-Cila.md](./ADIM-04-Test-Cila.md)

---

## Başlamadan

```powershell
cd c:\txData
.\scripts\preflight-server.ps1
```

Sunucuyu restart et. F8 konsolu açık tut.

---

## 5 dakika — smoke test

1. **Giriş** — hata yok, hoş geldin chat yok, Legion civarı spawn
2. **Karakter ekranı** — Türkçe (locale yüklenmezse fallback TR)
3. **Chat** — T, `/me`, `/b`, `/kurallar`, `/komutlar` (tek satır notify)
4. **Araç** — LS Cars al → M kontak → K kilit → `/km` → Pillbox garaj
5. **HUD** — km/s, menü (`I`) tam Türkçe
6. **Envanter** — TAB, drop etiketi "Yer"

---

## 15 dakika — tam MVP test

### Giriş & dünya
- [ ] Yeni karakter + kıyafet akışı
- [ ] Spawn noktası seçimi Türkçe
- [ ] Interior'da `/disari`, `/fdoor`, `/dimsifirla`

### Ekonomi & araç
- [ ] Galeri çift satın alma yok, spawn vitrin üstüne binmiyor
- [ ] Garaj park / çıkar / depot — etiketler Türkçe
- [ ] Yakıt HUD hatasız (qb-fuel)
- [ ] Banka / ATM arayüzü Türkçe

### PD (2. hesap veya test karakteri)
- [ ] On/off duty
- [ ] Off duty: stash, obje, spotlight, arama **kapalı**
- [ ] On duty: kelepçe, impound
- [ ] `/911` → PD bildirimi

### EMS
- [ ] Off duty: revive/bandaj **kapalı**
- [ ] On duty: `/911` EMS, revive akışı
- [ ] Ölüm → respawn hastane

### Güvenlik (gözlem)
- [ ] Notify/chat çift mesaj yok
- [ ] Admin `/revive` çalışıyor

---

## Tur özeti (hızlı referans)

| Tur | Odak |
|-----|------|
| 12–14 | Chat, HUD, galeri, garaj |
| 15–16 | TR etiketler, EMS yakıt, garaj güvenlik |
| 17–20 | Anahtar, doorlock, impound, preflight |
| 21–22 | PD obje, banka TR, log guard, HUD TR |
| 23 | Kelepçe/revive metadata |
| 24 | PD off duty guard, respawn, envanter |

Detay: [DURUM.md](./DURUM.md)

---

## Sorun bulursan

Not al: ne yaptın, ne oldu, F8 hatası var mı.  
Kritik bug → düzeltme → smoke test tekrar.

## Test bitince

[ILERLEME.md](../ILERLEME.md) → oyun içi test milestone **+12 puan → 70%**
