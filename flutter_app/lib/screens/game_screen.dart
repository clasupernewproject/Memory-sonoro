import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/levels.dart';
import '../models/game_level.dart';
import '../models/sound_item.dart';

class _CardEntry {
  _CardEntry(this.item, this.serial);
  final SoundItem item;
  final int serial;
  bool faceUp = false;
  bool matched = false;
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key, required this.level});

  final GameLevel level;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final AudioPlayer _player = AudioPlayer();
  final Random _random = Random();
  late List<_CardEntry> _cards;
  late Future<Uint8List> _background;
  int? _firstIndex;
  bool _locked = false;
  bool _soundOn = true;
  int _moves = 0;
  int _pairs = 0;

  @override
  void initState() {
    super.initState();
    _background = widget.level.backgroundAsset == null
        ? Future<Uint8List>.value(Uint8List(0))
        : rootBundle
            .loadString(widget.level.backgroundAsset!)
            .then((value) => base64Decode(value.trim()));
    _reset(notify: false);
  }

  void _reset({bool notify = true}) {
    final cards = <_CardEntry>[];
    var serial = 0;
    for (final item in widget.level.items) {
      cards.add(_CardEntry(item, serial++));
      cards.add(_CardEntry(item, serial++));
    }
    cards.shuffle(_random);
    _cards = cards;
    _firstIndex = null;
    _locked = false;
    _moves = 0;
    _pairs = 0;
    if (notify && mounted) setState(() {});
  }

  Future<void> _play(SoundItem item) async {
    if (!_soundOn) return;
    try {
      await _player.stop();
      await _player.play(UrlSource(item.audioUrl));
    } catch (_) {}
  }

  Future<void> _pick(int index) async {
    if (_locked || _cards[index].faceUp || _cards[index].matched) return;
    setState(() => _cards[index].faceUp = true);
    await _play(_cards[index].item);

    if (_firstIndex == null) {
      _firstIndex = index;
      return;
    }

    final first = _firstIndex!;
    _firstIndex = null;
    _moves++;
    _locked = true;
    setState(() {});

    if (_cards[first].item.id == _cards[index].item.id) {
      await Future<void>.delayed(const Duration(milliseconds: 350));
      if (!mounted) return;
      setState(() {
        _cards[first].matched = true;
        _cards[index].matched = true;
        _pairs++;
        _locked = false;
      });
      if (_pairs == widget.level.items.length) {
        await Future<void>.delayed(const Duration(milliseconds: 350));
        if (mounted) _showWin();
      }
    } else {
      await Future<void>.delayed(const Duration(milliseconds: 950));
      if (!mounted) return;
      setState(() {
        _cards[first].faceUp = false;
        _cards[index].faceUp = false;
        _locked = false;
      });
    }
  }

  void _showWin() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('⭐ Bravissimo! ⭐'),
        content: Text('Hai trovato tutte le coppie in $_moves mosse.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _reset();
            },
            child: const Text('Gioca ancora'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Home'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Widget _roundButton(IconData icon, VoidCallback onPressed, String tooltip) {
    return Material(
      color: Colors.white.withOpacity(.92),
      shape: const CircleBorder(),
      elevation: 2,
      child: IconButton(tooltip: tooltip, onPressed: onPressed, icon: Icon(icon, color: const Color(0xFF173D9B))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF86D3F7),
      body: SafeArea(
        child: Center(
          child: AspectRatio(
            aspectRatio: 2 / 3,
            child: LayoutBuilder(
              builder: (context, box) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    FutureBuilder<Uint8List>(
                      future: _background,
                      builder: (context, snapshot) {
                        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                          return Image.memory(snapshot.data!, fit: BoxFit.fill, gaplessPlayback: true);
                        }
                        return _LevelBackdrop(level: widget.level);
                      },
                    ),
                    Positioned(
                      left: box.maxWidth * .227,
                      top: box.maxHeight * .398,
                      width: box.maxWidth * .626,
                      height: box.maxHeight * .399,
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 1,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 4,
                        ),
                        itemCount: _cards.length,
                        itemBuilder: (context, index) {
                          final card = _cards[index];
                          final visible = card.faceUp || card.matched;
                          return Semantics(
                            button: true,
                            label: visible ? card.item.name : 'Carta coperta',
                            child: InkWell(
                              key: ValueKey(card.serial),
                              borderRadius: BorderRadius.circular(10),
                              onTap: () => _pick(index),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 220),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: visible
                                      ? (card.matched ? const Color(0xFFDFFFD7) : const Color(0xFFFFF0CF))
                                      : Colors.transparent,
                                  border: visible ? Border.all(color: Colors.white, width: 2) : null,
                                ),
                                child: visible
                                    ? FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Padding(
                                          padding: const EdgeInsets.all(3),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(card.item.emoji, style: const TextStyle(fontSize: 34)),
                                              Text(card.item.name, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w900)),
                                            ],
                                          ),
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      left: box.maxWidth * .40,
                      top: box.maxHeight * .26,
                      child: _Counter(value: '$_pairs'),
                    ),
                    Positioned(
                      left: box.maxWidth * .646,
                      top: box.maxHeight * .26,
                      child: _Counter(value: '$_moves'),
                    ),
                    Positioned(
                      left: 10,
                      top: 10,
                      child: _roundButton(
                        _soundOn ? Icons.volume_up : Icons.volume_off,
                        () async {
                          setState(() => _soundOn = !_soundOn);
                          if (!_soundOn) await _player.stop();
                        },
                        'Audio',
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: _roundButton(Icons.home_rounded, () => Navigator.pop(context), 'Home'),
                    ),
                    Positioned(
                      left: box.maxWidth * .46,
                      top: box.maxHeight * .18,
                      child: _roundButton(Icons.refresh, _reset, 'Ricomincia'),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _Counter extends StatelessWidget {
  const _Counter({required this.value});
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 34, minHeight: 28),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 7),
      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: Text(value, style: const TextStyle(color: Color(0xFF112D70), fontWeight: FontWeight.w900)),
    );
  }
}


class _LevelBackdrop extends StatelessWidget {
  const _LevelBackdrop({required this.level});
  final GameLevel level;

  @override
  Widget build(BuildContext context) {
    final colors = switch (level.id) {
      'city' => const [Color(0xFF8ED9FF), Color(0xFFDDE8EE)],
      'sea' => const [Color(0xFF74D8F7), Color(0xFF0877B9)],
      _ => const [Color(0xFFB9E27A), Color(0xFF86D3F7)],
    };
    return DecoratedBox(
      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: colors)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(level.emoji, style: const TextStyle(fontSize: 92)),
          Text(level.name, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Colors.white)),
        ],
      ),
    );
  }
}
