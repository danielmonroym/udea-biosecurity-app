import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udea_biosecurity_app/models/models.dart';
import 'package:udea_biosecurity_app/providers/providers.dart';
import 'package:udea_biosecurity_app/screens/screens.dart';
import 'package:udea_biosecurity_app/services/services.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
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
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Udea Biosecurity App',
        initialRoute: 'login',
        routes: {
          'login': (_) => LoginScreen(),
          'home': (_) => HomeScreen(),
          'place-details': (context) => DetailsScreen(
                placeId: ModalRoute.of(context)!.settings.arguments as String,
              ),
          'register': (_) => RegisterScreen(),
          'confirmation': (context) => ConfirmationScreen(
                succesfulInvitationData:
                    ModalRoute.of(context)!.settings.arguments as Invitation,
              )
        },
        scaffoldMessengerKey: NotificationsService.messengerKey,
        theme: ThemeData.light()
            .copyWith(scaffoldBackgroundColor: Colors.grey[300]));
  }
}
