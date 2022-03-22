import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:udea_biosecurity_app/providers/booking_form_provider.dart';
import 'package:udea_biosecurity_app/providers/invitations_provider.dart';
import 'package:udea_biosecurity_app/providers/login_form_provider.dart';
import 'package:udea_biosecurity_app/providers/register_form_provider.dart';
import 'package:udea_biosecurity_app/providers/site_detail_provider.dart';
import 'package:udea_biosecurity_app/providers/sites_provider.dart';
import 'package:udea_biosecurity_app/services/auth_service.dart';
import 'package:udea_biosecurity_app/services/user_service.dart';
import 'package:udea_biosecurity_app/widgets/ui/ui_widgets.dart';

void main() {
  testWidgets('ui drawer test', (WidgetTester tester) async {
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
      child: MaterialApp(home: UiDrawer()),
    ));

    expect(find.textContaining('Udea Biosegura App'), findsOneWidget);
    expect(find.textContaining('Usuario:'), findsOneWidget);
    expect(find.textContaining('Logout'), findsOneWidget);
  });
}
