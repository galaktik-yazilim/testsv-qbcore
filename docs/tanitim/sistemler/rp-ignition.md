# Araç Kontağı (rp-ignition)

## Özet

Araçlara bindiğinizde motor **otomatik çalışmaz**. Hard RP'de kontağı siz açarsınız; chat'e otomatik mesaj düşer.

## Kimler kullanabilir?

Anahtarı olan sürücü.

## Nasıl kullanılır?

1. Araca **sürücü koltuğuna** binin
2. Kontağı açmak/kapatmak için atanmış tuşa basın (keybind — `rp-ignition/client/keybinds.lua`)
3. Chat'te görünür: `Ahmet Yılmaz isimli kişi aracı çalıştırdı`

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
