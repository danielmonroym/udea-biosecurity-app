import 'package:flutter/material.dart';
import 'package:udea_biosecurity_app/widgets/login/login_widgets.dart';

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
                  Text(
                    'Login',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(height: 30),
                  LoginForm()
                ],
              ),
            ),
            SizedBox(height: 20),
            TextButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, 'register'),
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                        Colors.indigo.withOpacity(0.1)),
                    shape: MaterialStateProperty.all(StadiumBorder())),
                child: Text(
                  'Crear una nueva cuenta',
                  style: TextStyle(fontSize: 18, color: Color(0xff2E6347)),
                )),
            SizedBox(height: 50),
          ],
        ),
      ),
    ));
  }
}
