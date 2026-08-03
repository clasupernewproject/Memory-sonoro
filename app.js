const commonsFile = fileName =>
  `https://commons.wikimedia.org/wiki/Special:Redirect/file/${encodeURIComponent(fileName)}`;

const animals = [
  {
    id: "cow",
    name: "mucca",
    emoji: "🐮",
    color: "#7aa8ff",
    sound: commonsFile("Single Cow Moo.ogg"),
    fallbackNotes: [196, 164, 147]
  },
  {
    id: "pig",
    name: "maiale",
    emoji: "🐷",
    color: "#ff9eb5",
    sound: commonsFile("Pig grunt - Erdie.ogg"),
    fallbackNotes: [330, 392, 330]
  },
  {
    id: "chicken",
    name: "gallina",
    emoji: "🐔",
    color: "#ffd45f",
    sound: commonsFile("Chickens demanding food.ogg"),
    fallbackNotes: [660, 784, 880],
    stopAfter: 2.2
  },
  {
    id: "horse",
    name: "cavallo",
    emoji: "🐴",
    color: "#d9a36c",
    sound: commonsFile("Wiehern.ogg"),
    fallbackNotes: [220, 247, 220, 196]
  },
  {
    id: "sheep",
    name: "pecora",
    emoji: "🐑",
    color: "#b7df8b",
    sound: commonsFile("Sheep bleat.ogg"),
    fallbackNotes: [294, 262, 247]
  },
  {
    id: "dog",
    name: "cane",
    emoji: "🐶",
    color: "#65cdb8",
    sound: commonsFile("Barking of a dog.ogg"),
    fallbackNotes: [440, 330, 440]
  }
];

const board = document.querySelector("#gameBoard");
const scoreEl = document.querySelector("#score");
const movesEl = document.querySelector("#moves");
const messageEl = document.querySelector("#message");
const restartButton = document.querySelector("#restart");
const playAgainButton = document.querySelector("#playAgain");
const celebration = document.querySelector("#celebration");
const soundHelp = document.querySelector("#soundHelp");

let deck = [];
let firstCard = null;
let secondCard = null;
let lockBoard = false;
let matches = 0;
let moves = 0;
let audioContext = null;
let currentAudio = null;
let stopTimer = null;

function getAudioContext() {
  if (!audioContext) {
    audioContext = new (window.AudioContext || window.webkitAudioContext)();
  }
  if (audioContext.state === "suspended") audioContext.resume();
  return audioContext;
}

function playToneSequence(notes, options = {}) {
  const ctx = getAudioContext();
  const now = ctx.currentTime;
  const duration = options.duration || 0.18;
  const gap = options.gap || 0.06;
  const type = options.type || "sine";

  notes.forEach((frequency, index) => {
    const osc = ctx.createOscillator();
    const gain = ctx.createGain();
    const start = now + index * (duration + gap);

    osc.type = type;
    osc.frequency.setValueAtTime(frequency, start);
    gain.gain.setValueAtTime(0.0001, start);
    gain.gain.exponentialRampToValueAtTime(0.18, start + 0.02);
    gain.gain.exponentialRampToValueAtTime(0.0001, start + duration);

    osc.connect(gain);
    gain.connect(ctx.destination);
    osc.start(start);
    osc.stop(start + duration + 0.03);
  });
}

function stopCurrentAudio() {
  clearTimeout(stopTimer);
  if (!currentAudio) return;
  currentAudio.pause();
  currentAudio.currentTime = 0;
  currentAudio = null;
}

function playAnimalSound(animal) {
  stopCurrentAudio();

  const audio = new Audio(animal.sound);
  audio.preload = "auto";
  audio.volume = 0.9;
  currentAudio = audio;

  const fallback = () => {
    if (currentAudio === audio) currentAudio = null;
    const type = animal.id === "cow" || animal.id === "horse" ? "sawtooth" : "sine";
    playToneSequence(animal.fallbackNotes, { type, duration: 0.2, gap: 0.04 });
  };

  audio.addEventListener("error", fallback, { once: true });
  audio.addEventListener("ended", () => {
    if (currentAudio === audio) currentAudio = null;
  }, { once: true });

  audio.play().catch(fallback);

  if (animal.stopAfter) {
    stopTimer = setTimeout(() => {
      if (currentAudio === audio) stopCurrentAudio();
    }, animal.stopAfter * 1000);
  }
}

function playSuccess() {
  playToneSequence([523, 659, 784, 1046], {
    type: "triangle",
    duration: 0.22,
    gap: 0.03
  });
}

function animateAnimal(card, className) {
  const animal = card.querySelector(".animal");
  if (!animal) return;
  animal.classList.remove(className);
  void animal.offsetWidth;
  animal.classList.add(className);
}

function shuffle(array) {
  const copy = [...array];
  for (let i = copy.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [copy[i], copy[j]] = [copy[j], copy[i]];
  }
  return copy;
}

function buildDeck() {
  deck = shuffle(animals.flatMap(animal => [
    { ...animal, instance: `${animal.id}-a` },
    { ...animal, instance: `${animal.id}-b` }
  ]));
}

function renderBoard() {
  board.innerHTML = "";
  deck.forEach(animal => {
    const card = document.createElement("button");
    card.className = "card";
    card.type = "button";
    card.dataset.id = animal.id;
    card.dataset.instance = animal.instance;
    card.setAttribute("aria-label", "Carta coperta");
    card.innerHTML = `
      <span class="card-inner">
        <span class="card-face card-back"></span>
        <span class="card-face card-front" style="--accent:${animal.color}">
          <span class="animal" aria-hidden="true">${animal.emoji}</span>
          <span class="sound-icon" aria-hidden="true">🔊</span>
        </span>
      </span>
    `;
    card.addEventListener("click", () => flipCard(card, animal));
    board.appendChild(card);
  });
}

function flipCard(card, animal) {
  if (lockBoard || card === firstCard || card.classList.contains("is-matched")) return;

  card.classList.add("is-flipped");
  card.setAttribute("aria-label", `Carta ${animal.name}`);
  setTimeout(() => animateAnimal(card, "animal-awake"), 180);
  playAnimalSound(animal);

  if (!firstCard) {
    firstCard = card;
    messageEl.textContent = "Ora scegli una seconda carta.";
    return;
  }

  secondCard = card;
  moves += 1;
  movesEl.textContent = moves;
  checkMatch();
}

function checkMatch() {
  const isMatch = firstCard.dataset.id === secondCard.dataset.id;

  if (isMatch) {
    const matchedCards = [firstCard, secondCard];
    matchedCards.forEach(card => card.classList.add("is-matched"));

    setTimeout(() => {
      matchedCards.forEach(card => animateAnimal(card, "animal-celebrate"));
    }, 120);

    matches += 1;
    scoreEl.textContent = `${matches} / 6`;
    messageEl.textContent = "Hai trovato una coppia!";
    resetTurn();

    if (matches === animals.length) {
      setTimeout(showCelebration, 900);
    }
  } else {
    lockBoard = true;
    messageEl.textContent = "Non sono uguali. Riascolta e riprova.";
    setTimeout(() => {
      firstCard.classList.remove("is-flipped");
      secondCard.classList.remove("is-flipped");
      firstCard.setAttribute("aria-label", "Carta coperta");
      secondCard.setAttribute("aria-label", "Carta coperta");
      resetTurn();
      messageEl.textContent = "Tocca due carte e ascolta i suoni.";
    }, 1250);
  }
}

function resetTurn() {
  [firstCard, secondCard] = [null, null];
  lockBoard = false;
}

function showCelebration() {
  stopCurrentAudio();
  celebration.hidden = false;
  playSuccess();
}

function startGame() {
  stopCurrentAudio();
  matches = 0;
  moves = 0;
  firstCard = null;
  secondCard = null;
  lockBoard = false;
  scoreEl.textContent = "0 / 6";
  movesEl.textContent = "0";
  messageEl.textContent = "Tocca due carte e ascolta i suoni.";
  celebration.hidden = true;
  buildDeck();
  renderBoard();
}

restartButton.addEventListener("click", startGame);
playAgainButton.addEventListener("click", startGame);
soundHelp.addEventListener("click", () => {
  playSuccess();
  messageEl.textContent = "Audio attivo! Ora tocca una carta.";
});

startGame();
