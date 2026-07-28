import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

/// Lint rule that flags hardcoded [Color] values outside theme files.
///
/// Detects:
///   - `Color(0xFF...)`
///   - `Color.fromARGB(...)`
///
/// Allowed only inside `theme.dart` or `app_theme.dart`.
class AvoidHardcodedColor extends DartLintRule {
  const AvoidHardcodedColor() : super(code: _code);

  static const _code = LintCode(
    name: 'avoid_hardcoded_color',
    problemMessage:
        'Usa colores del Design System en lugar de valores hardcodeados',
    errorSeverity: ErrorSeverity.WARNING,
  );

  /// Files that are allowed to define raw Color values.
  static const _allowedFiles = {'theme.dart', 'app_theme.dart'};

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    // Skip theme files — they are the canonical source of color definitions.
    final fileName = resolver.path.split('/').last.split(r'\').last;
    if (_allowedFiles.contains(fileName)) return;

    context.registry.addInstanceCreationExpression((node) {
      final typeName = node.constructorName.type.name2.lexeme;
      if (typeName != 'Color') return;

      final namedConstructor = node.constructorName.name?.name;

      // Match Color(…) — unnamed constructor (hexadecimal literal).
      // Match Color.fromARGB(…) — named constructor.
      if (namedConstructor == null || namedConstructor == 'fromARGB') {
        reporter.reportErrorForNode(_code, node);
      }
    });
  }
}
