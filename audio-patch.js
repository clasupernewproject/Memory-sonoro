// Sostituzione del verso della gallina con un canto di gallo più breve e riconoscibile.
(() => {
  const NativeAudio = window.Audio;
  const oldChickenFile = "Chickens%20demanding%20food.ogg";
  const betterRooster = "https://commons.wikimedia.org/wiki/Special:Redirect/file/Young_rooster_crowing.ogg";

  function PatchedAudio(src) {
    const finalSrc = typeof src === "string" && src.includes(oldChickenFile)
      ? betterRooster
      : src;
    return new NativeAudio(finalSrc);
  }

  PatchedAudio.prototype = NativeAudio.prototype;
  window.Audio = PatchedAudio;
})();
