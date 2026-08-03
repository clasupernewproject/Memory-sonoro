/*
  Correzione audio per Safari/iPad.
  Traduce i link con reindirizzamento di Wikimedia negli URL diretti dei file OGG.
*/
(() => {
  const NativeAudio = window.Audio;

  const directAudio = {
    "Single Cow Moo.ogg": "https://upload.wikimedia.org/wikipedia/commons/a/a5/Single_Cow_Moo.ogg",
    "Pig grunt - Erdie.ogg": "https://upload.wikimedia.org/wikipedia/commons/a/ac/Pig_grunt_-_Erdie.ogg",
    "Chickens demanding food.ogg": "https://upload.wikimedia.org/wikipedia/commons/d/d6/Chickens_demanding_food.ogg",
    "Wiehern.ogg": "https://upload.wikimedia.org/wikipedia/commons/d/db/Wiehern.ogg",
    "Sheep bleat.ogg": "https://upload.wikimedia.org/wikipedia/commons/2/28/Sheep_bleat.ogg",
    "Barking of a dog.ogg": "https://upload.wikimedia.org/wikipedia/commons/a/a2/Barking_of_a_dog.ogg"
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
