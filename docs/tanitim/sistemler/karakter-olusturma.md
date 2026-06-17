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
| James Miller | xX_Ahmet_Xx |
| Maria Santos | Test123 |
| Ahmet Yılmaz (göçmen RP) | `<script>` |
| Jean-Pierre | Meme / ünlü isim |

## Oluşturma adımları

1. Sunucuya bağlan
2. Boş slota tıkla (+)
3. Ad, soyad, doğum tarihi, cinsiyet, uyruk gir
4. Onayla — karakter son konumunda veya varsayılan spawn'da başlar

**Uyruk (IC):** Los Santos evreninde yaşayan karakterin kökeni — örn. `American`, `Mexican`, `Turkish`. Arayüz Türkçe olması evrenin Türkiye olduğu anlamına gelmez.

## Başlangıç ekonomisi (MVP)

| Hesap | Miktar |
|-------|--------|
| Nakit | $150 |
| Banka | $850 |
| İşsiz maaş | $0 |

## Whitelist

> **Test döneminde kapalı** — herkes girebilir. Beta öncesi açılacak: [ADIM-05](../gelistirme/ADIM-05-Kapali-Beta.md)

## Teknik

| Alan | Değer |
|------|-------|
| Resource | `qb-multicharacter` |
| Config | `config.lua` — slot, yaş, isim limitleri |
| Doğrulama | **Sunucu tarafı** (`server.lua`) |
