// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:financasfacil/main.dart';

void main() {
  testWidgets('Financial Analysis App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const FinancasFacilApp());

    // Verify that our app loads with the expected title
    expect(find.text('📊 Análise Financeira'), findsOneWidget);
    
    // Verify that instruction text is present
    expect(find.textContaining('Como usar:'), findsOneWidget);
    
    // Verify that some key sections are present
    expect(find.textContaining('Balanço Patrimonial'), findsOneWidget);
    expect(find.textContaining('DRE'), findsOneWidget);
    expect(find.textContaining('Liquidez'), findsOneWidget);
  });

  testWidgets('Input fields are working', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const FinancasFacilApp());

    // Find the first text field (Caixa e Equivalentes)
    final caixaField = find.byType(TextField).first;
    expect(caixaField, findsOneWidget);

    // Verify that the field has the default value
    expect(find.text('100000'), findsAtLeastNWidgets(1));
  });
}
