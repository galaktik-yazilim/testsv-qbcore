const { ref } = Vue

// Customize language for dialog menus and carousels here

const load = Vue.createApp({
  setup () {
    return {
      CarouselText1: 'Los Santos hard RP — text-based sunucuya hoş geldiniz.',
      CarouselSubText1: 'Evren: Los Santos (Amerika) · Arayüz Türkçe · Mesafeler metre.',
      CarouselText2: 'Voice yok — tüm iletişim chat ile: T, /me, /do, /b.',
      CarouselSubText2: 'Oyun içi: /kurallar ve /komutlar',
      CarouselText3: 'Mağaza NPC\'leri kapalı; dünya sakin ve RP odaklı.',
      CarouselSubText3: 'M kontak · K kilit · L kemer · /km (metrik)',
      CarouselText4: 'İyi roller — Fear RP ve saygı.',
      CarouselSubText4: 'Los Santos · Hard RP',

      DownloadTitle: 'Sunucu Yükleniyor',
      DownloadDesc: "Oyun için gerekli tüm kaynaklar indiriliyor, lütfen bekleyin.\n\nİndirme tamamlandığında sunucuya bağlanacaksınız ve bu ekran kapanacak. Lütfen oyundan çıkmayın veya bilgisayarı kapatmayın.",

      SettingsTitle: 'Ayarlar',
      AutoPlayDesc2: 'Kapalıyken slayt görselleri dönmeyi durdurur ve son görselde kalır.',

      KeybindTitle: 'Tuş Atamaları',
      Keybind1: 'Envanter (TAB)',
      Keybind2: 'Chat (T) — yakınlık konuşma',
      Keybind3: '/me · /do · /b — RP komutları',
      Keybind4: 'Emniyet Kemeri (L)',
      Keybind5: 'Hedef Menüsü (ALT)',
      Keybind6: '— (radial kapalı)',
      Keybind7: 'HUD Menüsü',
      Keybind8: '— (voice kapalı)',
      Keybind9: 'Oyuncu Listesi',
      Keybind10: 'Araç Kilidi (K)',
      Keybind11: 'Kontak (M)',
      Keybind12: 'İşaret Emote',
      Keybind13: 'Hızlı Slot',
      Keybind14: 'Eller Yukarı',
      Keybind15: 'Eşya Slotları',
      Keybind16: 'Hız Sabitleyici',

      firstap: ref(true),
      secondap: ref(true),
      thirdap: ref(true),
      firstslide: ref(1),
      secondslide: ref('1'),
      thirdslide: ref('5'),
      download: ref(true),
      settings: ref(false),
    }
  }
})

load.use(Quasar, { config: {} })
load.mount('#loading-main')

function videotoggle() {
    var video = document.getElementById("video");
    if (!video) return;
    if (video.paused) {
        video.play();
    } else {
        video.pause();
    }
}

let count = 0;
let thisCount = 0;

const handlers = {
    startInitFunctionOrder(data) {
        count = data.count;
    },

    initFunctionInvoking(data) {
        document.querySelector(".thingy").style.left = "0%";
        document.querySelector(".thingy").style.width = (data.idx / count) * 100 + "%";
    },

    startDataFileEntries(data) {
        count = data.count;
    },

    performMapLoadFunction(data) {
        ++thisCount;

        document.querySelector(".thingy").style.left = "0%";
        document.querySelector(".thingy").style.width = (thisCount / count) * 100 + "%";
    },
};

window.addEventListener("message", function (e) {
    (handlers[e.data.eventName] || function () {})(e.data);
});
