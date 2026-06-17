/**
 * Translations utility for QB-Multicharacter
 * Handles all translation functionality in one place
 */

class TranslationManager {
    constructor() {
        this.translations = {};
        this.fallbacks = {
            deletechar_description: "Bu karakteri silmek istediğinize emin misiniz?",
            confirm: "Onayla",
            cancel: "İptal",
            chardel_header: "Karakter Kaydı",
            firstname: "Ad",
            lastname: "Soyad",
            nationality: "Uyruk",
            birthdate: "Doğum Tarihi",
            gender: "Cinsiyet",
            male: "Erkek",
            female: "Kadın",
            create_button: "Karakter Oluştur",
            retrieving_playerdata: "Oyuncu verileri alınıyor...",
            validating_playerdata: "Oyuncu verileri doğrulanıyor...",
            retrieving_characters: "Karakterler yükleniyor...",
            validating_characters: "Karakterler doğrulanıyor...",
            ran_into_issue: "Bir sorun oluştu!",
            profanity: "Girdiğiniz metin uygunsuz kelime içeriyor. Lütfen tekrar deneyin.",
            forgotten_field: "Bir alanı doldurmayı unuttunuz!",
            connection_error: "Bağlantı hatası. Lütfen tekrar deneyin.",
            delete_failed: "Karakter silinemedi. Lütfen tekrar deneyin.",
            selection_failed: "Karakter seçilemedi. Lütfen tekrar deneyin.",
            creation_failed: "Karakter oluşturulamadı. Lütfen tekrar deneyin.",
            setup_failed: "Karakterler yüklenemedi. Lütfen tekrar deneyin.",
            firstname_too_short: "Ad en az 2 karakter olmalıdır.",
            firstname_too_long: "Ad en fazla 16 karakter olabilir.",
            lastname_too_short: "Soyad en az 2 karakter olmalıdır.",
            lastname_too_long: "Soyad en fazla 16 karakter olabilir.",
            invalid_date: "Geçerli bir doğum tarihi girin.",
            date: "Doğum Tarihi",
            field: "Alan",
        };
    }

    /**
     * Set translations from server
     * @param {Object} translations - Translation key-value pairs
     */
    setTranslations(translations) {
        this.translations = translations || {};
    }

    /**
     * Get translation for a key
     * @param {string} key - Translation key
     * @returns {string} Translated text or fallback
     */
    translate(key) {
        // First check in server-provided translations
        if (this.translations[key]) {
            return this.translations[key];
        }

        // Then check in fallbacks
        if (this.fallbacks[key]) {
            return this.fallbacks[key];
        }

        // Return the key itself if no translation found
        return key;
    }

    /**
     * Format a translation with dynamic values
     * @param {string} key - Translation key
     * @param {Object} params - Object containing replacement values
     * @returns {string} Formatted translation
     */
    formatTranslation(key, params) {
        let text = this.translate(key);

        if (params) {
            Object.keys(params).forEach((param) => {
                text = text.replace(`{${param}}`, params[param]);
            });
        }

        return text;
    }
}

// Create a global instance for the application
const translationManager = new TranslationManager();
