// ⚡ NIVEL SAIYAJIN
//
// Estas reglas no existen en ningún paquete de la comunidad: son propias
// del equipo, escritas con `custom_lint` y viven en
// lib/packages/team_lints/lib/src/rules/.
//
// Para verlas: activa el bloque "NIVEL SAIYAJIN" en pubspec.yaml y
// analysis_options.yaml, corre `flutter pub get` y luego:
//   dart run custom_lint

import 'package:flutter/material.dart';

/// Contrato del repositorio de usuarios.
abstract class UserRepository {
  /// Obtiene el nombre del usuario actual.
  String getUserName();
}

// ❌ repository_naming (team_lints, ERROR): implementa un `Repository`
// pero su nombre no termina en 'Impl'.
// ✅ Solución: usa el quick-fix del IDE (💡) o renombra a
// `LocalUserRepositoryImpl` — el fix de team_lints agrega el sufijo
// 'Impl' al nombre existente, así que el nombre elegido debe leerse bien
// con ese sufijo pegado al final.
class LocalUserRepository implements UserRepository {
  @override
  String getUserName() => 'Vegeta';
}

/// Pantalla de ejemplo del nivel Saiyajin.
class SaiyajinLevelPage extends StatelessWidget {
  /// Crea la página del nivel Saiyajin.
  const SaiyajinLevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserRepository repository = LocalUserRepository();

    return Scaffold(
      appBar: AppBar(title: const Text('⚡ Saiyajin')),
      body: Container(
        // ❌ avoid_hardcoded_color (team_lints, WARNING): color fuera de
        // theme.dart / app_theme.dart.
        // ✅ Solución: mueve el valor a una constante del Design System,
        // p.ej. `AppColors.saiyajinOrange`, definida en theme.dart.
        color: const Color(0xFFFF5733),
        child: Center(
          child: Text('Hola, ${repository.getUserName()}'),
        ),
      ),
    );
  }
}
