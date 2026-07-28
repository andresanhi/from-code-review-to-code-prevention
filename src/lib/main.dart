import 'package:flutter/material.dart';

import 'levels/level_1_terricola.dart';
import 'levels/level_2_androide.dart';
import 'levels/level_3_saiyajin.dart';

void main() {
  runApp(const MyApp());
}

/// App raíz de la demo "Del Code Review al Code Prevention".
class MyApp extends StatelessWidget {
  /// Crea la app raíz.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Linters Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: const LevelSelectorPage(),
    );
  }
}

class _LevelInfo {
  const _LevelInfo({
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.builder,
  });

  final String emoji;
  final String title;
  final String subtitle;
  final WidgetBuilder builder;
}

/// Pantalla de inicio: elige uno de los 3 niveles de linters.
class LevelSelectorPage extends StatelessWidget {
  /// Crea la pantalla de selección de nivel.
  const LevelSelectorPage({super.key});

  static final List<_LevelInfo> _levels = [
    _LevelInfo(
      emoji: '🌍',
      title: 'Terrícola',
      subtitle: 'flutter_lints — activo por defecto',
      // TerricolaLevelPage() no es `const` a propósito: es uno de los
      // errores que el nivel 1 debe mostrar (ver level_1_terricola.dart).
      builder: (_) => TerricolaLevelPage(),
    ),
    _LevelInfo(
      emoji: '🤖',
      title: 'Androide',
      subtitle: 'very_good_analysis + DCL',
      builder: (_) => const AndroideLevelPage(discountPercentage: 15),
    ),
    _LevelInfo(
      emoji: '⚡',
      title: 'Saiyajin',
      subtitle: 'custom_lint + reglas propias del equipo',
      builder: (_) => const SaiyajinLevelPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Del Code Review al Code Prevention')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (final level in _levels)
            Card(
              child: ListTile(
                leading: Text(
                  level.emoji,
                  style: const TextStyle(fontSize: 28),
                ),
                title: Text(level.title),
                subtitle: Text(level.subtitle),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(builder: level.builder),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
