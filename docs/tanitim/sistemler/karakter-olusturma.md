# Karakter Oluşturma

## Özet

Hard RP sunucusunda **her oyuncunun 1 karakteri** vardır. Karakter silme oyuncuya kapalıdır; CK (Character Kill) admin prosedürü ile yapılır.

## Kurallar

| Kural | Açıklama |
|-------|----------|
| Tek karakter | 1 slot — ikinci karakter açılamaz |
| Gerçekçi isim | Rakam, sembol, meme isim yasak |
| Minimum yaş | 18 (doğum tarihi ile kontrol) |
| Silme | Oyuncu silemez; admin `deletechar` (god) |

## İsim örnekleri

| ✅ Kabul | ❌ Red |
|---------|--------|
| Ahmet Yılmaz | xX_Ahmet_Xx |
| Elif Şahin | Test123 |
| Jean-Pierre | `<script>` |

## Oluşturma adımları

1. Sunucuya bağlan
2. Boş slota tıkla (+)
3. Ad, soyad, doğum tarihi, cinsiyet, uyruk gir
4. Onayla — karakter son konumunda veya varsayılan spawn'da başlar

## Başlangıç ekonomisi (MVP)

| Hesap | Miktar |
|-------|--------|
| Nakit | $150 |
| Banka | $850 |
| İşsiz maaş | $0 |

## Whitelist

Kapalı beta döneminde sunucu whitelist ile korunabilir. Detay: [ADIM-01](../gelistirme/ADIM-01-MVP-Temel.md)

## Teknik

| Alan | Değer |
|------|-------|
| Resource | `qb-multicharacter` |
| Config | `config.lua` — slot, yaş, isim limitleri |
| Doğrulama | **Sunucu tarafı** (`server.lua`) |
