import '../models/game_level.dart';
import '../models/sound_item.dart';

const farmItems = <SoundItem>[
  SoundItem(id: 'cow', name: 'Mucca', emoji: '🐄', audioUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/48/Mudchute_cow_1.ogg'),
  SoundItem(id: 'rooster', name: 'Gallo', emoji: '🐓', audioUrl: 'https://upload.wikimedia.org/wikipedia/commons/c/c5/Rooster_crowing.ogg'),
  SoundItem(id: 'sheep', name: 'Pecora', emoji: '🐑', audioUrl: 'https://upload.wikimedia.org/wikipedia/commons/8/8f/Sheep_bleating.ogg'),
  SoundItem(id: 'horse', name: 'Cavallo', emoji: '🐎', audioUrl: 'https://upload.wikimedia.org/wikipedia/commons/d/db/Wiehern.ogg'),
  SoundItem(id: 'pig', name: 'Maiale', emoji: '🐖', audioUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/4a/Mudchute_pig_2.ogg'),
  SoundItem(id: 'dog', name: 'Cane', emoji: '🐕', audioUrl: 'https://upload.wikimedia.org/wikipedia/commons/a/a2/Barking_of_a_dog.ogg'),
];

const cityItems = <SoundItem>[
  SoundItem(id: 'bus', name: 'Autobus', emoji: '🚌', audioUrl: 'https://commons.wikimedia.org/wiki/Special:Redirect/file/WWS%20CityBusMANSG220horn.ogg'),
  SoundItem(id: 'siren', name: 'Sirena', emoji: '🚨', audioUrl: 'https://commons.wikimedia.org/wiki/Special:Redirect/file/Siren.ogg'),
  SoundItem(id: 'horn', name: 'Clacson', emoji: '🚗', audioUrl: 'https://commons.wikimedia.org/wiki/Special:Redirect/file/Car%20Horn.wav'),
  SoundItem(id: 'bell', name: 'Campanello', emoji: '🔔', audioUrl: 'https://upload.wikimedia.org/wikipedia/commons/9/90/Doorbell-cheap-dingdong.ogg'),
  SoundItem(id: 'train', name: 'Treno', emoji: '🚆', audioUrl: 'https://upload.wikimedia.org/wikipedia/commons/7/7a/WWS_Signalhorntrainhorn.ogg'),
  SoundItem(id: 'beep', name: 'Semaforo', emoji: '🚦', audioUrl: 'https://commons.wikimedia.org/wiki/Special:Redirect/file/Beep-09.ogg'),
];

const seaItems = <SoundItem>[
  SoundItem(id: 'wave', name: 'Onde', emoji: '🌊', audioUrl: 'https://commons.wikimedia.org/wiki/Special:Redirect/file/Small%20sea%20waves%20at%20rocky%20beach.opus'),
  SoundItem(id: 'gull', name: 'Gabbiano', emoji: '🐦', audioUrl: 'https://commons.wikimedia.org/wiki/Special:Redirect/file/M%C3%B6wengeschrei.ogg'),
  SoundItem(id: 'boat', name: 'Barca', emoji: '⛵', audioUrl: 'https://commons.wikimedia.org/wiki/Special:Redirect/file/Bl%C3%BCmlisalp%20Horn.ogg'),
  SoundItem(id: 'dolphin', name: 'Delfino', emoji: '🐬', audioUrl: 'https://commons.wikimedia.org/wiki/Special:Redirect/file/161691%20felixblume%20dolphin-screaming-underwater-in-caribbean-sea-mexico.wav'),
  SoundItem(id: 'splash', name: 'Splash', emoji: '💦', audioUrl: 'https://commons.wikimedia.org/wiki/Special:Redirect/file/Emptying%20syringe%20in%20water%20slow.ogg'),
  SoundItem(id: 'shell', name: 'Conchiglia', emoji: '🐚', audioUrl: 'https://commons.wikimedia.org/wiki/Special:Redirect/file/Conch%20shell.ogg'),
];

const levels = <GameLevel>[
  GameLevel(id: 'farm', name: 'La fattoria', emoji: '🐄', items: farmItems, backgroundAsset: 'assets/artwork/fattoria.b64'),
  GameLevel(id: 'city', name: 'La città', emoji: '🚌', items: cityItems),
  GameLevel(id: 'sea', name: 'Il mare', emoji: '🌊', items: seaItems),
  GameLevel(id: 'mountain', name: 'La montagna', emoji: '🦅', items: [], available: false),
  GameLevel(id: 'woods', name: 'Il bosco', emoji: '🐺', items: [], available: false),
  GameLevel(id: 'jungle', name: 'La giungla', emoji: '🐒', items: [], available: false),
  GameLevel(id: 'night', name: 'La notte', emoji: '🦉', items: [], available: false),
  GameLevel(id: 'savanna', name: 'La savana', emoji: '🦁', items: [], available: false),
];
