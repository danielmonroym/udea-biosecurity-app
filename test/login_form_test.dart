// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:udea_biosecurity_app/providers/booking_form_provider.dart';
import 'package:udea_biosecurity_app/providers/invitations_provider.dart';
import 'package:udea_biosecurity_app/providers/login_form_provider.dart';
import 'package:udea_biosecurity_app/providers/register_form_provider.dart';
import 'package:udea_biosecurity_app/providers/site_detail_provider.dart';
import 'package:udea_biosecurity_app/providers/sites_provider.dart';
import 'package:udea_biosecurity_app/screens/screens.dart';
import 'package:udea_biosecurity_app/services/services.dart';

void main() {
  testWidgets('login form test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginFormProvider()),
        ChangeNotifierProvider(create: (_) => RegisterFormProvider()),
        ChangeNotifierProvider(create: (_) => BookingFormProvider()),
        ChangeNotifierProvider(
            create: (_) => InvitationProvider(AuthService())),
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => SitesProvider(AuthService())),
        ChangeNotifierProvider(
            create: (_) => SiteDetailProvider(AuthService())),
        ChangeNotifierProvider(create: (_) => UserService(AuthService())),
      ],
      child: MaterialApp(home: LoginScreen()),
    ));

    expect(find.textContaining('Login'), findsOneWidget);
    expect(find.textContaining('Crear una nueva cuenta'), findsOneWidget);

    await tester.enterText(find.byKey(Key("email-form")), "correo@gmail.com");

    expect(find.text('correo@gmail.com'), findsOneWidget);
  });
}
