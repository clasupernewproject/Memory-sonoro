import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../data/levels.dart';
import '../models/sound_item.dart';

class _CardEntry {
  _CardEntry(this.item, this.serial);
  final SoundItem item;
  final int serial;
  bool faceUp = false;
  bool matched = false;
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final AudioPlayer _player = AudioPlayer();
  final Random _random = Random();
  late List<_CardEntry> _cards;
  int? _firstIndex;
  bool _locked = false;
  bool _soundOn = true;
  int _moves = 0;
  int _pairs = 0;

  @override
  void initState() {
    super.initState();
    _reset();
  }

  void _reset() {
    final cards = <_CardEntry>[];
    var serial = 0;
    for (final item in farmItems) {
      cards.add(_CardEntry(item, serial++));
      cards.add(_CardEntry(item, serial++));
    }
    cards.shuffle(_random);
    _cards = cards;
    _firstIndex = null;
    _locked = false;
    _moves = 0;
    _pairs = 0;
    if (mounted) setState(() {});
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
      if (_pairs == farmItems.length) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB9E27A),
      appBar: AppBar(
        title: const Text('🐄 La fattoria'),
        actions: [
          IconButton(
            tooltip: 'Audio',
            onPressed: () async {
              setState(() => _soundOn = !_soundOn);
              if (!_soundOn) await _player.stop();
            },
            icon: Icon(_soundOn ? Icons.volume_up : Icons.volume_off),
          ),
          IconButton(tooltip: 'Ricomincia', onPressed: _reset, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Coppie: $_pairs/6', style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text('Mosse: $_moves', style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: .78,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
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
                        borderRadius: BorderRadius.circular(16),
                        onTap: () => _pick(index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 180),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: visible ? const Color(0xFFFFF0B5) : const Color(0xFF2764B8),
                            border: Border.all(color: Colors.white, width: 3),
                            boxShadow: const [BoxShadow(blurRadius: 5, offset: Offset(0, 3), color: Color(0x33000000))],
                          ),
                          child: Center(
                            child: visible
                                ? Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(card.item.emoji, style: const TextStyle(fontSize: 42)),
                                      const SizedBox(height: 6),
                                      Text(card.item.name, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w800)),
                                    ],
                                  )
                                : const Icon(Icons.music_note, color: Colors.white, size: 42),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
