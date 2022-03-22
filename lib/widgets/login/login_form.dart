import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udea_biosecurity_app/providers/login_form_provider.dart';
import 'package:udea_biosecurity_app/services/services.dart';
import 'package:udea_biosecurity_app/ui/input_decorations.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    final userService = Provider.of<UserService>(context);
    return Container(
      child: Form(
          key: loginForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                key: Key("email-form"),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'john.doe@gmail.com',
                    labelText: 'Correo Electronico',
                    prefixIcon: Icons.alternate_email_rounded),
                onChanged: (value) => loginForm.email = value,
                validator: (value) {
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                  RegExp regExp = new RegExp(pattern);

                  return regExp.hasMatch(value ?? '')
                      ? null
                      : 'Correo invalido';
                },
              ),
              SizedBox(height: 30),
              TextFormField(
                key: Key("password-form"),
                autocorrect: false,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => loginForm.password = value,
                decoration: InputDecorations.authInputDecoration(
                    hintText: '******',
                    labelText: 'Password',
                    prefixIcon: Icons.lock_outline),
                validator: (value) {
                  if (value != null && value.length >= 6) return null;
                  return 'la contrasena debe ser de 6 caracteres';
                },
              ),
              SizedBox(height: 30),
              MaterialButton(
                  key: Key("login-button"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: Color(0xff2E6347),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    child: Text(
                      loginForm.isLoading ? 'Espere' : 'Ingresar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onPressed: loginForm.isLoading
                      ? null
                      : () async {
                          FocusScope.of(context).unfocus();
                          final authService =
                              Provider.of<AuthService>(context, listen: false);
                          if (!loginForm.isValidForm()) return;
                          loginForm.isLoading = true;
                          final String? errorMessage = await authService.login(
                              loginForm.email, loginForm.password);

                          if (errorMessage == null) {
                            await userService.getUserFromLogin();
                            if (userService.succesfulData) {
                              Navigator.pushReplacementNamed(context, 'home');
                            } else {
                              NotificationsService.showSnackbar(
                                  userService.responseUser);
                              loginForm.isLoading = false;
                            }
                          } else {
                            NotificationsService.showSnackbar(errorMessage);
                            loginForm.isLoading = false;
                          }
                        })
            ],
          )),
    );
  }
}
