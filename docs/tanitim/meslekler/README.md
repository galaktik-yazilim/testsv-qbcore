# Meslekler Rehberi

Bu klasörde her meslek için ayrı Türkçe tanıtım dosyası bulunur. **IC evren: Los Santos** (LSPD, Pillbox EMS vb.) — bkz. [evren-ve-dil.md](../evren-ve-dil.md).

## Aktif meslekler

| Meslek | Resource | Rehber |
|--------|----------|--------|
| Polis (LSPD) | `qb-policejob` | [polis.md](./polis.md) |
| Sağlık (EMS) | `qb-ambulancejob` | [saglik-gorevlisi.md](./saglik-gorevlisi.md) |

## Planlanan meslekler

Aşağıdaki meslekler QBCore paketinde mevcut ancak hard RP sunucusunda **bilinçli olarak kapalı**. Açıldığında bu klasöre rehber eklenecek:

| Meslek | Resource | Durum |
|--------|----------|-------|
| Taşımacılık / Kamyon | `qb-truckjob` veya custom | Planlanıyor |
| Çekici | `qb-towjob` | Kapalı |
| Taksi | `qb-taxijob` | Kapalı |
| Otobüs | `qb-busjob` | Kapalı |
| Tamirci | `qb-mechanicjob` | Kapalı |
| Çöp toplama | `qb-garbagejob` | Kapalı |

## Yeni meslek açarken

1. `server.cfg` içine `ensure meslek-resource` ekleyin
2. [SABLON.md](../SABLON.md) dosyasını kopyalayıp `meslekler/MESLEK-ADI.md` oluşturun
3. [CHANGELOG.md](../../CHANGELOG.md) güncelleyin
4. [TODO.md](../TODO.md) içindeki ilgili maddeyi işaretleyin

## Hard RP prensibi

Arcade meslekler (NPC'ye gidip tek tıkla iş) text RP ile çelişir. Meslek açarken:

- Başvuru / whitelist zorunlu tutun
- Gelirleri düşük ve RP odaklı ayarlayın
- `/me` ve `/do` ile prosedür zorunlu kılın
