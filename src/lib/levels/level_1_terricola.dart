// 🌍 NIVEL TERRÍCOLA
//
// Solo con `flutter_lints` (el set oficial de Google, activo por defecto en
// analysis_options.yaml) el analizador ya detecta estos 5 problemas.
// Corre `flutter analyze lib/levels/level_1_terricola.dart` o mira el panel
// de "Problems" de tu IDE.

import 'dart:math'; // ❌ unused_import: nunca se usa en este archivo.
// ✅ Solución: borra la línea.

import 'package:flutter/material.dart';

/// Pantalla de ejemplo del nivel Terrícola: errores que cualquier
/// proyecto Flutter nuevo debería atrapar con la config por defecto.
class TerricolaLevelPage extends StatelessWidget {
  // ❌ use_key_in_widget_constructors: falta el parámetro `key`.
  // ❌ prefer_const_constructors_in_immutables: debería poder ser `const`.
  TerricolaLevelPage();

  // ✅ Solución:
  // const TerricolaLevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ❌ prefer_adjacent_string_concatenation: concatenar literales con `+`.
    final String greeting = 'Hola' + ' ' + 'Saiyajin';
    // ✅ Solución: final String greeting = 'Hola Saiyajin';

    // ❌ avoid_print: no se debe usar print en código de producción.
    print('Construyendo TerricolaLevelPage');
    // ✅ Solución: usa `debugPrint(...)` o un logger, o borra la línea.

    return Scaffold(
      appBar: AppBar(title: const Text('🌍 Terrícola')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(greeting),
      ),
    );
  }
}
