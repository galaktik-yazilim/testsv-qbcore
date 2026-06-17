# Adım 05 — Kapalı Beta

> **Durum:** 📋 Hazır — whitelist **test bitince** açılır  
> Şu an: `setr qb_whitelist 0` (herkes girebilir)

---

## Ne zaman?

Adım 04 oyun içi test checklist'i tamamlandığında:
- Kritik bug yok
- Temel akış (chat, galeri, PD/EMS) çalışıyor

---

## Whitelist açma

### 1. server.cfg

```
setr qb_whitelist 1
```

ACE satırlarını aktif et:

```
add_ace group.whitelisted join allow
add_principal identifier.license:ROCKSTAR_LICENSE group.whitelisted
```

### 2. txAdmin alternatifi

txAdmin whitelist kullanırsan `qb_whitelist 0` bırakabilirsin.

### 3. Restart

---

## Beta süreci

- Süre: **3–7 gün**
- Oyuncu: **5–15 kişi**
- Checklist: [KAPALI-BETA-CHECKLIST.md](./KAPALI-BETA-CHECKLIST.md)

---

## Beta sonrası

- Geri bildirim topla (chat mesafesi, ekonomi ince ayarı)
- Discord + başvuru formu ([discord-ve-basvuru.md](../tanitim/discord-ve-basvuru.md))
- Kritik bug fix → açılış planı

---

## Tüm adımlar

| Adım | Konu |
|------|------|
| 01–03 | MVP + açılış altyapısı ✅ |
| 04 | Test & cila ✅ |
| 05 | Kapalı beta | Bu dosya |
| 06 | P4+ plan | [ADIM-06-P4-Plan.md](./ADIM-06-P4-Plan.md) |
