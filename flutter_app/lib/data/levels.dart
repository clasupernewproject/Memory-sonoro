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


const mountainItems = <SoundItem>[
  SoundItem(id: 'eagle', name: 'Aquila', emoji: '🦅', audioUrl: ''),
  SoundItem(id: 'deer', name: 'Cervo', emoji: '🦌', audioUrl: ''),
  SoundItem(id: 'marmot', name: 'Marmotta', emoji: '🐿️', audioUrl: ''),
  SoundItem(id: 'wind', name: 'Vento', emoji: '💨', audioUrl: ''),
  SoundItem(id: 'cowbell', name: 'Campanaccio', emoji: '🔔', audioUrl: ''),
  SoundItem(id: 'stream', name: 'Ruscello', emoji: '🏞️', audioUrl: ''),
];

const woodsItems = <SoundItem>[
  SoundItem(id: 'wolf', name: 'Lupo', emoji: '🐺', audioUrl: 'https://upload.wikimedia.org/wikipedia/commons/8/87/Wolf_howls.ogg'),
  SoundItem(id: 'bear', name: 'Orso', emoji: '🐻', audioUrl: ''),
  SoundItem(id: 'woodpecker', name: 'Picchio', emoji: '🐦', audioUrl: 'https://commons.wikimedia.org/wiki/Special:Redirect/file/Woodpeckerdrum.ogg'),
  SoundItem(id: 'squirrel', name: 'Scoiattolo', emoji: '🐿️', audioUrl: ''),
  SoundItem(id: 'stream', name: 'Ruscello', emoji: '💧', audioUrl: ''),
  SoundItem(id: 'leaves', name: 'Foglie', emoji: '🍃', audioUrl: ''),
];


const jungleItems = <SoundItem>[
  SoundItem(id: 'monkey', name: 'Scimmia', emoji: '🐒', audioUrl: 'https://upload.wikimedia.org/wikipedia/commons/b/b8/Howler_monkey.ogg'),
  SoundItem(id: 'parrot', name: 'Pappagallo', emoji: '🦜', audioUrl: 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Talking_Parrot_%28Psittacula_krameri%29.ogg'),
  SoundItem(id: 'jaguar', name: 'Giaguaro', emoji: '🐆', audioUrl: 'https://commons.wikimedia.org/wiki/Special:Redirect/file/Jaguar%20saw.flac'),
  SoundItem(id: 'toucan', name: 'Tucano', emoji: '🐦', audioUrl: 'https://commons.wikimedia.org/wiki/Special:Redirect/file/Keel-billed%20toucan.ogg'),
  SoundItem(id: 'rain', name: 'Pioggia', emoji: '🌧️', audioUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3d/Rain.ogg'),
  SoundItem(id: 'frog', name: 'Rana', emoji: '🐸', audioUrl: 'https://upload.wikimedia.org/wikipedia/commons/9/9f/Single_Frog_Croak.oga'),
];

const nightItems = <SoundItem>[
  SoundItem(id: 'owl', name: 'Gufo', emoji: '🦉', audioUrl: 'https://upload.wikimedia.org/wikipedia/commons/e/e6/Short-eared_Owl.ogg'),
  SoundItem(id: 'cricket', name: 'Grillo', emoji: '🦗', audioUrl: ''),
  SoundItem(id: 'frog', name: 'Rana', emoji: '🐸', audioUrl: ''),
  SoundItem(id: 'wolf', name: 'Lupo', emoji: '🐺', audioUrl: 'https://upload.wikimedia.org/wikipedia/commons/8/87/Wolf_howls.ogg'),
  SoundItem(id: 'wind', name: 'Vento', emoji: '💨', audioUrl: ''),
  SoundItem(id: 'nightbird', name: 'Uccello', emoji: '🐦', audioUrl: ''),
];


const savannaItems = <SoundItem>[
  SoundItem(id: 'lion', name: 'Leone', emoji: '🦁', audioUrl: 'https://commons.wikimedia.org/wiki/Special:Redirect/file/Lion%20raring-sound1TamilNadu178.ogg'),
  SoundItem(id: 'elephant', name: 'Elefante', emoji: '🐘', audioUrl: 'https://commons.wikimedia.org/wiki/Special:Redirect/file/Elephant%20voice%20-%20trumpeting.ogg'),
  SoundItem(id: 'zebra', name: 'Zebra', emoji: '🦓', audioUrl: 'https://commons.wikimedia.org/wiki/Special:Redirect/file/Gr%C3%A9vys%20zebra%20%28Sound%20Effects%29.ogg'),
  SoundItem(id: 'giraffe', name: 'Giraffa', emoji: '🦒', audioUrl: 'https://commons.wikimedia.org/wiki/Special:Redirect/file/Giraffe%20grunt.oga'),
  SoundItem(id: 'hippo', name: 'Ippopotamo', emoji: '🦛', audioUrl: 'https://commons.wikimedia.org/wiki/Special:Redirect/file/Hippo.ogv'),
  SoundItem(id: 'leopard', name: 'Leopardo', emoji: '🐆', audioUrl: 'https://commons.wikimedia.org/wiki/Special:Redirect/file/Leopard.ogv'),
];

const levels = <GameLevel>[
  GameLevel(id: 'farm', name: 'La fattoria', emoji: '🐄', items: farmItems, backgroundAsset: 'assets/artwork/fattoria.b64'),
  GameLevel(id: 'city', name: 'La città', emoji: '🚌', items: cityItems),
  GameLevel(id: 'sea', name: 'Il mare', emoji: '🌊', items: seaItems),
  GameLevel(id: 'mountain', name: 'La montagna', emoji: '🦅', items: mountainItems),
  GameLevel(id: 'woods', name: 'Il bosco', emoji: '🐺', items: woodsItems),
  GameLevel(id: 'jungle', name: 'La giungla', emoji: '🐒', items: jungleItems),
  GameLevel(id: 'night', name: 'La notte', emoji: '🦉', items: nightItems),
  GameLevel(id: 'savanna', name: 'La savana', emoji: '🦁', items: savannaItems),
];
