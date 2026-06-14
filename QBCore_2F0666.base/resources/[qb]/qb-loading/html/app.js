const { ref } = Vue

// Customize language for dialog menus and carousels here

const load = Vue.createApp({
  setup () {
    return {
      CarouselText1: 'Türk RP sunucusuna hoş geldiniz.',
      CarouselSubText1: 'Gerçekçi roleplay deneyimi için kurallara uyun.',
      CarouselText2: 'Envanter, telefon ve araç kontrolleri için tuş atamalarını aşağıdan inceleyebilirsiniz.',
      CarouselSubText2: 'Yardım için Discord sunucumuza katılın.',
      CarouselText3: 'Ambient NPC\'ler kapalıdır; dünya daha sakin ve RP odaklıdır.',
      CarouselSubText3: 'Motor, kilit ve emniyet kemeri manuel çalışır.',
      CarouselText4: 'İyi roller dileriz — eğlenin ve saygılı olun.',
      CarouselSubText4: 'Yerel geliştirme sunucusu',

      DownloadTitle: 'Sunucu Yükleniyor',
      DownloadDesc: "Oyun için gerekli tüm kaynaklar indiriliyor, lütfen bekleyin.\n\nİndirme tamamlandığında sunucuya bağlanacaksınız ve bu ekran kapanacak. Lütfen oyundan çıkmayın veya bilgisayarı kapatmayın.",

      SettingsTitle: 'Ayarlar',
      AutoPlayDesc2: 'Kapalıyken slayt görselleri dönmeyi durdurur ve son görselde kalır.',
      PlayVideoDesc3: 'Kapalıyken video duraklatılır.',

      KeybindTitle: 'Tuş Atamaları',
      Keybind1: 'Envanter',
      Keybind2: 'Yakınlık Sohbeti',
      Keybind3: 'Telefon (F2)',
      Keybind4: 'Emniyet Kemeri (L)',
      Keybind5: 'Hedef Menüsü',
      Keybind6: 'Radyal Menü',
      Keybind7: 'HUD Menüsü',
      Keybind8: 'Telsiz Konuşma',
      Keybind9: 'Oyuncu Listesi',
      Keybind10: 'Araç Kilidi (K)',
      Keybind11: 'Motor (M)',
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
      playvideo: ref(true),
      download: ref(true),
      settings: ref(false),
    }
  }
})

load.use(Quasar, { config: {} })
load.mount('#loading-main')

function videotoggle() {
    var video = document.getElementById("video");
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
