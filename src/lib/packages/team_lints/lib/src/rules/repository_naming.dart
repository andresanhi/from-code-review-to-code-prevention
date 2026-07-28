import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:analyzer/source/source_range.dart';

/// Lint rule that enforces Repository implementation classes end with 'Impl'.
///
/// Any class that implements an interface whose name contains "Repository"
/// must have a name ending in "Impl".
class RepositoryNaming extends DartLintRule {
  const RepositoryNaming() : super(code: _code);

  static const _code = LintCode(
    name: 'repository_naming',
    problemMessage: "Las implementaciones de Repository deben terminar en 'Impl'",
    errorSeverity: ErrorSeverity.ERROR,
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addClassDeclaration((node) {
      final implementsClause = node.implementsClause;
      if (implementsClause == null) return;

      // Check if any implemented interface contains 'Repository' in its name.
      final implementsRepository = implementsClause.interfaces.any(
        (interface) => interface.name2.lexeme.contains('Repository'),
      );

      if (!implementsRepository) return;

      // The class name must end in 'Impl'.
      final className = node.name.lexeme;
      if (!className.endsWith('Impl')) {
        reporter.reportErrorForToken(_code, node.name);
      }
    });
  }

  @override
  List<Fix> getFixes() => [_AddImplSuffix()];
}

class _AddImplSuffix extends DartFix {
  @override
  void run(
    CustomLintResolver resolver,
    ChangeReporter reporter,
    CustomLintContext context,
    AnalysisError analysisError,
    List<AnalysisError> others,
  ) {
    context.registry.addClassDeclaration((node) {
      // Make sure we are fixing the right class.
      if (analysisError.offset != node.name.offset) return;

      final oldName = node.name.lexeme;
      final newName = '${oldName}Impl';

      final changeBuilder = reporter.createChangeBuilder(
        message: "Renombrar a '$newName'",
        priority: 1,
      );

      changeBuilder.addDartFileEdit((builder) {
        builder.addSimpleReplacement(
          SourceRange(node.name.offset, node.name.length),
          newName,
        );
      });
    });
  }
}
