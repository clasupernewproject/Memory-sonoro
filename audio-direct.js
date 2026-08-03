/*
  Audio compatibile con Safari/iPad.
  Usa le transcodifiche MP3 di Wikimedia invece dei file OGG.
*/
(() => {
  const NativeAudio = window.Audio;

  const directAudio = {
    "Single Cow Moo.ogg": "https://upload.wikimedia.org/wikipedia/commons/transcoded/a/a5/Single_Cow_Moo.ogg/Single_Cow_Moo.ogg.mp3",
    "Pig grunt - Erdie.ogg": "https://upload.wikimedia.org/wikipedia/commons/transcoded/a/ac/Pig_grunt_-_Erdie.ogg/Pig_grunt_-_Erdie.ogg.mp3",
    "Chickens demanding food.ogg": "https://upload.wikimedia.org/wikipedia/commons/transcoded/4/43/Young_rooster_crowing.ogg/Young_rooster_crowing.ogg.mp3",
    "Wiehern.ogg": "https://upload.wikimedia.org/wikipedia/commons/transcoded/d/db/Wiehern.ogg/Wiehern.ogg.mp3",
    "Sheep bleat.ogg": "https://upload.wikimedia.org/wikipedia/commons/transcoded/2/28/Sheep_bleat.ogg/Sheep_bleat.ogg.mp3",
    "Barking of a dog.ogg": "https://upload.wikimedia.org/wikipedia/commons/transcoded/a/a2/Barking_of_a_dog.ogg/Barking_of_a_dog.ogg.mp3"
  };

  function resolveAudioSource(source = "") {
    if (!source.includes("Special:Redirect/file/")) return source;

    const encodedName = source.split("Special:Redirect/file/").pop();
    const fileName = decodeURIComponent(encodedName || "");
    return directAudio[fileName] || source;
  }

  function CompatibleAudio(source) {
    return new NativeAudio(resolveAudioSource(source));
  }

  CompatibleAudio.prototype = NativeAudio.prototype;
  window.Audio = CompatibleAudio;
})();
