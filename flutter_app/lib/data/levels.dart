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

const levels = <GameLevel>[
  GameLevel(id: 'farm', name: 'La fattoria', emoji: '🐄', items: farmItems, backgroundAsset: 'assets/artwork/fattoria.b64'),
  GameLevel(id: 'city', name: 'La città', emoji: '🚌', items: [], available: false),
  GameLevel(id: 'sea', name: 'Il mare', emoji: '🌊', items: [], available: false),
  GameLevel(id: 'mountain', name: 'La montagna', emoji: '🦅', items: [], available: false),
  GameLevel(id: 'woods', name: 'Il bosco', emoji: '🐺', items: [], available: false),
  GameLevel(id: 'jungle', name: 'La giungla', emoji: '🐒', items: [], available: false),
  GameLevel(id: 'night', name: 'La notte', emoji: '🦉', items: [], available: false),
  GameLevel(id: 'savanna', name: 'La savana', emoji: '🦁', items: [], available: false),
];
