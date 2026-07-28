import 'package:team_lints/team_lints.dart';
import 'package:test/test.dart';

void main() {
  group('AvoidHardcodedColor', () {
    test('lint code name is correct', () {
      const rule = AvoidHardcodedColor();
      expect(rule.code.name, equals('avoid_hardcoded_color'));
    });

    test('severity is WARNING', () {
      const rule = AvoidHardcodedColor();
      expect(rule.code.errorSeverity.name, equals('WARNING'));
    });

    test('problem message mentions Design System', () {
      const rule = AvoidHardcodedColor();
      expect(rule.code.problemMessage, contains('Design System'));
    });

    test('provides no quick fix', () {
      const rule = AvoidHardcodedColor();
      expect(rule.getFixes(), isEmpty);
    });
  });
}
