import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/main.dart';

void main() {
  testWidgets("For Testing the Home Screen tittle",
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Calculator(),
    ));

    Finder title = find.text("Calculator");
    expect(title, findsOneWidget);
  });

  testWidgets("For Testing the Claculator Page for Addition",
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Calculator(),
    ));

    Finder firstNumber = find.byKey(const ValueKey('firstNumber'));
    await tester.enterText(firstNumber, '10');

    Finder secondNumber = find.byKey(const ValueKey('secondNumber'));
    await tester.enterText(secondNumber, '20');

    Finder addBtn = find.byKey(const ValueKey('addBtn'));
    await tester.tap(addBtn);

    await tester.pump();

    expect(find.text('Result:30.0'), findsOneWidget);

  });



  testWidgets("For Testing the Claculator Page for Subtraction",
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Calculator(),
    ));

    Finder firstNumber = find.byKey(const ValueKey('firstNumber'));
    await tester.enterText(firstNumber, '20');

    Finder secondNumber = find.byKey(const ValueKey('secondNumber'));
    await tester.enterText(secondNumber, '10');

    Finder subtractBtn = find.byKey(const ValueKey('subtractBtn'));
    await tester.tap(subtractBtn);

    await tester.pump();

    expect(find.text('Result:10.0'), findsOneWidget);

  });


   testWidgets("For Testing the Claculator Page for Subtraction",
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Calculator(),
    ));

    Finder firstNumber = find.byKey(const ValueKey('firstNumber'));
    await tester.enterText(firstNumber, '20');

    Finder secondNumber = find.byKey(const ValueKey('secondNumber'));
    await tester.enterText(secondNumber, '10');

    
    Finder addBtn = find.byKey(const ValueKey('addBtn'));
    await tester.tap(addBtn);

    await tester.pump();
  });
}
