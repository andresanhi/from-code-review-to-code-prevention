import 'package:team_lints/team_lints.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryNaming', () {
    test('lint code name is correct', () {
      const rule = RepositoryNaming();
      expect(rule.code.name, equals('repository_naming'));
    });

    test('severity is ERROR', () {
      const rule = RepositoryNaming();
      expect(rule.code.errorSeverity.name, equals('ERROR'));
    });

    test('exposes a quick fix', () {
      const rule = RepositoryNaming();
      expect(rule.getFixes(), hasLength(1));
    });

    test('problem message mentions Impl', () {
      const rule = RepositoryNaming();
      expect(rule.code.problemMessage, contains('Impl'));
    });
  });
}
