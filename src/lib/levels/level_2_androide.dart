// 🤖 NIVEL ANDROIDE
//
// Con `very_good_analysis` (Very Good Ventures) + `dart_code_linter` (DCL)
// el analizador se vuelve mucho más estricto que el nivel Terrícola.
// Recuerda: para ver estos errores primero activa el bloque "NIVEL ANDROIDE"
// en pubspec.yaml y analysis_options.yaml y corre `flutter pub get`.
//
// ⚠️ Las reglas de VGA corren con el analyzer normal:
//   flutter analyze lib/levels/level_2_androide.dart
// Las reglas de DCL NO aparecen ahí — el mecanismo clásico de `analyzer:
// plugins:` solo corre dentro del analysis server del IDE, no en la CLI.
// Para verlas por terminal, DCL trae su propio runner:
//   dart run dart_code_linter:metrics analyze lib

import 'package:flutter/material.dart';

// ❌ public_member_api_docs (VGA): clase pública sin documentación.
class AndroideLevelPage extends StatelessWidget {
  // ✅ Solución: agrega un doc comment `///` describiendo la clase.

  // ❌ always_put_required_named_parameters_first (VGA): `key` (opcional)
  // va antes que `discountPercentage` (requerido).
  const AndroideLevelPage({super.key, required this.discountPercentage});
  // ✅ Solución: const AndroideLevelPage({required this.discountPercentage, super.key});

  // ❌ public_member_api_docs (VGA): campo público sin documentación.
  final int discountPercentage;

  // ❌ public_member_api_docs (VGA): método público sin documentación.
  // ❌ avoid_positional_boolean_parameters (VGA): `bool` posicional.
  int calculateFinalPrice(int originalPrice, bool isPremiumMember) {
    // ✅ Solución: documenta el método y convierte `isPremiumMember`
    // en un parámetro nombrado (`{required bool isPremiumMember}`).

    // ❌ omit_local_variable_types (VGA): el tipo `bool` es redundante,
    // el analizador ya lo infiere del lado derecho.
    final bool isEligible = discountPercentage > 18 && discountPercentage < 100;
    // ✅ Solución: final isEligible = ...;

    // ❌ avoid-nested-conditional-expressions (DCL): ternario dentro de otro.
    final int finalPrice = isEligible
        ? (isPremiumMember ? originalPrice ~/ 2 : originalPrice)
        : originalPrice;
    // ✅ Solución: extrae la lógica a un if/else o a un método auxiliar.

    return finalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ❌ prefer-trailing-comma (DCL): llamada multilínea sin coma final
      // antes del paréntesis que cierra `AppBar(...)`.
      appBar: AppBar(
        title: const Text('🤖 Androide')
      ),
      // ✅ Solución: agrega una coma después de `const Text('🤖 Androide')`.
      body: Center(
        // ❌ no-magic-number (DCL): el `100` no tiene nombre ni contexto.
        // ✅ Solución: const demoDiscount = 100; ...calculateFinalPrice(demoDiscount, true)
        child: Text('Precio final: ${calculateFinalPrice(100, true)}'),
      ),
    );
  }
}
