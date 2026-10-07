import 'sound_item.dart';

class GameLevel {
  const GameLevel({
    required this.id,
    required this.name,
    required this.emoji,
    required this.items,
    this.backgroundAsset,
    this.available = true,
  });

  final String id;
  final String name;
  final String emoji;
  final List<SoundItem> items;
  final String? backgroundAsset;
  final bool available;
}
