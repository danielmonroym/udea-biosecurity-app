import 'package:flutter/material.dart';
import 'package:udea_biosecurity_app/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 300),
            AuthCardContainer(
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Text('Login', style: Theme.of(context).textTheme.headline4),
                  SizedBox(height: 30)
                ],
              ),
            ),
            SizedBox(height: 50),
            Text('Crear una nueva cuenta'),
            SizedBox(height: 50),
          ],
        ),
      ),
    ));
  }
}
