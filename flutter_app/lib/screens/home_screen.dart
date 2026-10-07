import 'package:flutter/material.dart';
import 'game_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F8FF),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Memory Sonoro', style: TextStyle(fontSize: 38, fontWeight: FontWeight.w900)),
                const SizedBox(height: 6),
                const Text('Colori da Ascoltare', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                const SizedBox(height: 40),
                SizedBox(
                  width: 280,
                  height: 120,
                  child: FilledButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const GameScreen()),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('🐄', style: TextStyle(fontSize: 42)),
                        Text('La fattoria', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                const Text('Prima versione Flutter · 6 coppie sonore'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
