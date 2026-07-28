// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_linters_demo/main.dart';

void main() {
  testWidgets('LevelSelectorPage lists the 3 levels and navigates to each',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Terrícola'), findsOneWidget);
    expect(find.text('Androide'), findsOneWidget);
    expect(find.text('Saiyajin'), findsOneWidget);

    await tester.tap(find.text('Terrícola'));
    await tester.pumpAndSettle();
    expect(find.text('🌍 Terrícola'), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle();

    await tester.tap(find.text('Androide'));
    await tester.pumpAndSettle();
    expect(find.text('🤖 Androide'), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle();

    await tester.tap(find.text('Saiyajin'));
    await tester.pumpAndSettle();
    expect(find.text('⚡ Saiyajin'), findsOneWidget);
  });
}
