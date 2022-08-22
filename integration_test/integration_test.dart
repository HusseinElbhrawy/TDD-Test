import 'package:flutter/material.dart';
import 'package:flutter_tdd_testing/presentation/home_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import '../lib/main.dart' as app;

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Success Login',
    (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final emailFinder = find.byType(TextFormField).first;
      await tester.enterText(emailFinder, 'hussein@gmail.com');
      await tester.pumpAndSettle();

      final passwordFinder = find.byType(TextFormField).last;
      await tester.enterText(passwordFinder, '123456');
      await tester.pumpAndSettle();

      await tester.tap(find.byType(CheckboxListTile));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.byType(HomeScreen), findsOneWidget);
    },
  );
}
