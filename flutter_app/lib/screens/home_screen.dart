import 'package:flutter/material.dart';

import '../data/levels.dart';
import 'game_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F8FF),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  const Text('Memory Sonoro', textAlign: TextAlign.center, style: TextStyle(fontSize: 38, fontWeight: FontWeight.w900)),
                  const Text('Colori da Ascoltare', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFF167B3D))),
                  const SizedBox(height: 8),
                  const Text('Scegli un ambiente', style: TextStyle(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 16),
                  Expanded(
                    child: GridView.builder(
                      itemCount: levels.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.25,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemBuilder: (context, index) {
                        final level = levels[index];
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: level.available
                                ? () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => GameScreen(level: level)))
                                : null,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(level.emoji, style: const TextStyle(fontSize: 40)),
                                  const SizedBox(height: 6),
                                  Text(level.name, textAlign: TextAlign.center, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900)),
                                  if (!level.available) const Text('presto', style: TextStyle(fontSize: 12, color: Colors.black54)),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
