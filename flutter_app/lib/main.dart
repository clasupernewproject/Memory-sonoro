import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(const MemorySonoroApp());

class MemorySonoroApp extends StatelessWidget {
  const MemorySonoroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Memory Sonoro',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF7FD2FA)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
