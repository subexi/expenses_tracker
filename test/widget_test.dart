// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';


void main() {
  testWidgets('Start screen shows app bar and seeded expenses', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: Expenses()));

    expect(find.text('Flutter ExpenseTracker'), findsOneWidget);
    expect(find.text('Flutter Course'), findsOneWidget);
    expect(find.text('Cinema'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });

  testWidgets('Tap on add icon opens new expense bottom sheet', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: Expenses()));

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    expect(find.text('Save Expense'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
    expect(find.widgetWithText(TextField, 'Title'), findsOneWidget);
    expect(find.widgetWithText(TextField, 'Amount'), findsOneWidget);
    expect(find.text('No date selected'), findsOneWidget);
  });

  testWidgets('Swipe to delete shows snackbar and undo restores item', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: Expenses()));

    expect(find.text('Flutter Course'), findsOneWidget);

    await tester.drag(find.byType(Dismissible).first, const Offset(-500, 0));
    await tester.pumpAndSettle();

    expect(find.text('Flutter Course'), findsNothing);
    expect(find.text('Flutter Course removed.'), findsOneWidget);
    expect(find.text('Undo'), findsOneWidget);

    await tester.tap(find.text('Undo'));
    await tester.pumpAndSettle();

    expect(find.text('Flutter Course'), findsOneWidget);
  });
}
