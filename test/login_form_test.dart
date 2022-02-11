// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:udea_biosecurity_app/screens/screens.dart';

void main() {
  testWidgets('login screen test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    // Verify that our counter starts at 0.
    expect(find.textContaining('Login'), findsOneWidget);
    expect(find.textContaining('Crear una nueva cuenta'), findsOneWidget);

    await tester.enterText(find.byKey(Key("email-form")), "correo@gmail.com");

    expect(find.text('correo@gmail.com'), findsOneWidget);
  });
}
