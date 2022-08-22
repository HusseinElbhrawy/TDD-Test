// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_tdd_testing/app.dart';
import 'package:flutter_tdd_testing/presentation/home_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test Login and home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

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

    expect(find.byType(HomeScreen), find);
  });
}
