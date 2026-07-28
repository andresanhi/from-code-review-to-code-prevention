library team_lints;

import 'package:custom_lint_builder/custom_lint_builder.dart';

import 'src/rules/avoid_hardcoded_color.dart';
import 'src/rules/repository_naming.dart';

export 'src/rules/avoid_hardcoded_color.dart';
export 'src/rules/repository_naming.dart';

/// Entrypoint expected by `custom_lint`'s aggregated plugin runner.
PluginBase createPlugin() => _TeamLintsPlugin();

class _TeamLintsPlugin extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => const [
        RepositoryNaming(),
        AvoidHardcodedColor(),
      ];
}
