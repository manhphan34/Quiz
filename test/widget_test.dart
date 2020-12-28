// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:test/test.dart';

void main() {
  test('Counter value should be incremented', () {
    int c = 0;
    c++;
    expect(c, 1);
  });
}
