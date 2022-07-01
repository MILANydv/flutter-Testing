import 'package:flutter_test/flutter_test.dart';
import 'package:testing/model/arithmetic.dart';

void main() {
  group('addition and multiplication test', () {
    test("add two numbers", () {
    final arithmetic = Arithmetic();
    arithmetic.firstNumber = 1;
    arithmetic.secondNumber = 2;
    int expectedValue = 3;
    int actualValue = arithmetic.add();
    expect(expectedValue, actualValue);
  });

  test("subtract two numbers", () {
    final arithmetic = Arithmetic();
    arithmetic.firstNumber = 1;
    arithmetic.secondNumber = 2;
    int expectedValue = -1;
    int actualValue = arithmetic.subtract();
    expect(expectedValue, actualValue);
  });
  });
  

  test("multiply two numbers", () {
    final arithmetic = Arithmetic();
    arithmetic.firstNumber = 1;
    arithmetic.secondNumber = 2;
    int expectedValue = 2;
    int actualValue = arithmetic.multiply();
    expect(expectedValue, actualValue);
  });
}
