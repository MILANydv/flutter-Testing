import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:testing/main.dart';
import 'package:testing/second_screen.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("For Testing the Claculator Page for Addition",
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      routes: {
        '/second': (context) => const SecondScreen(),
      },
      home: const Calculator(),
    ));

    Finder firstNumber = find.byKey(const ValueKey('firstNumber'));
    await tester.enterText(firstNumber, '10');

    Finder secondNumber = find.byKey(const ValueKey('secondNumber'));
    await tester.enterText(secondNumber, '20');

    Finder addBtn = find.byKey(const ValueKey('addBtn'));
    await tester.tap(addBtn);

    await tester.pumpAndSettle();

    expect(find.text('Result:30.0'), findsOneWidget);
  });
}
