# Polis Mesleği (LSPD)

## Özet

Los Santos Polis Departmanı. Hard RP sunucusunda polis rolü **whitelist ve başvuru** ile verilir (henüz otomatik başvuru sistemi yok — admin atar).

## Kimler oynayabilir?

- Whitelist onaylı PD üyeleri
- `qb-policejob` job'u `police` olarak atanmış karakterler

## Temel görevler

- Devriye ve 911 çağrılarına müdahale
- Trafik kontrolü, kelepçe, arama, gözaltı
- Adli süreç RP'si (ifade, tutuklama)

## Komutlar & tuşlar

Resource: `qb-policejob` — detaylar config ve keybind dosyalarında.

| Eylem | Genel kullanım |
|-------|----------------|
| Kelepçe | Hedef yakınında etkileşim |
| Araç arama | `/me X kişisini arar` + script |
| Radial / menü | Sunucuda `qb-radialmenu` kapalı olabilir — komut tabanlı kullanın |

> **Not:** Bu sunucuda radial menu kapalıdır. Polis eylemlerini **chat ile destekleyin**.

## RP prosedürü örnekleri

**Durdurma:**
```
/me devriye aracının ışıklarını yakar, megafondan anons yapar.
DUR! Ellerini görebileceğim yere koy!
```

**Arama:**
```
/me şüphelinin üzerini yavaşça aramaya başlar.
/do Cebinde küçük bir paket bulunur.
```

**Tutuklama:**
```
/me kelepçeleri takar ve Miranda haklarını okur.
```

## Yasak davranışlar

- Sebepsiz silah çekmek (RDM)
- Kanıt olmadan tutuklamak
- OOC bilgi ile IC baskın (metagaming)
- Script'e güvenip `/me` yazmadan arama yapmak

## Teknik

| Alan | Değer |
|------|-------|
| Resource | `qb-policejob` |
| Job adı | `police` |
| Bağımlılık | `qb-core`, envanter, garaj |

## İleride eklenecek

- Text tabanlı 911 dispatch
- Kanıt / MDW sadeleştirmesi
- Faction başvuru formu
