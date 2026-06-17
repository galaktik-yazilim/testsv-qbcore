# Adim 26 — Whitelist & ACE Otomasyon

> **Durum:** Tamamlandi  
> Elle ACE / server.cfg duzenleme gerekmez

---

## Scriptler

| Script | Ne yapar |
|--------|----------|
| `setup-dev-env.ps1` | Dev modu + test-oncesi (tek komut) |
| `enable-dev-mode.ps1` | Whitelist kapali (test) |
| `enable-beta-mode.ps1` | Whitelist ac + ACE sync |
| `sync-whitelist-ace.ps1` | `whitelist-licenses.txt` -> server.cfg |
| `whitelist-licenses.txt` | Beta oyuncu license listesi |

---

## Beta oyuncu ekleme

1. `scripts/whitelist-licenses.txt` satir ekle (`license:HEX`)
2. `.\scripts\sync-whitelist-ace.ps1`
3. Restart

---

## server.cfg

ACE blogu isaretli bolgede tutulur:

```
# --- WHITELIST ACE (auto) ---
add_ace group.whitelisted join allow
add_principal identifier.license:... group.whitelisted
# --- WHITELIST ACE END ---
```

Elle duzenleme yapma — script kullan.
