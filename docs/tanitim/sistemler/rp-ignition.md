# Araç Kontağı (rp-ignition)

## Özet

Araçlara bindiğinizde motor **otomatik çalışmaz**. Hard RP'de kontağı siz açarsınız; chat'e otomatik mesaj düşer.

## Kimler kullanabilir?

Anahtarı olan sürücü.

## Nasıl kullanılır?

1. Araca **sürücü koltuğuna** binin
2. **M** — kontak aç/kapa
3. Chat: `Ahmet Yılmaz isimli kişi aracı çalıştırdı`

| Tuş | Eylem |
|-----|-------|
| **M** | Kontak |
| **K** | Araç kilidi (`qb-vehiclekeys`) |
| **L** | Emniyet kemeri |

## RP kuralları

- Anahtarınız yoksa motoru çalıştıramazsınız — `/me ile zorlamayın`
- Motor kapalıyken aracı sürmeye devam etmeyin (motor kapalı = hareket etmez)
- Bisikletler (class 13) bu sistemden muaftır

## Anahtar sistemi

`qb-vehiclekeys` ile entegredir. Satın aldığınız veya size verilen aracın anahtarı otomatik gelir.

## Teknik

| Alan | Değer |
|------|-------|
| Resource | `rp-ignition` |
| Bağımlılık | `qb-core`, `qb-vehiclekeys`, `rp-chat` |
