import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udea_biosecurity_app/providers/login_form_provider.dart';
import 'package:udea_biosecurity_app/providers/register_form_provider.dart';
import 'package:udea_biosecurity_app/services/services.dart';
import 'package:udea_biosecurity_app/ui/input_decorations.dart';

class RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<RegisterFormProvider>(context);

    return Container(
      child: Form(
        key: registerForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.name,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Nombre',
                  labelText: 'Nombre',
                  prefixIcon: Icons.verified_user_outlined),
              onChanged: (value) => registerForm.name = value,
              validator: (value) {
                if (value == null || value.length < 1)
                  return 'El nombre es obligatorio';
              },
            ),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.streetAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Dirección',
                  labelText: 'Dirección',
                  prefixIcon: Icons.streetview_outlined),
              onChanged: (value) => registerForm.address = value,
              validator: (value) {
                if (value == null || value.length < 1)
                  return 'La dirección es obligatoria';
              },
            ),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.phone,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Teléfono',
                  labelText: 'Teléfono',
                  prefixIcon: Icons.phone_callback_outlined),
              onChanged: (value) => registerForm.phone = value,
              validator: (value) {
                if (value == null || value.length < 1)
                  return 'El teléfono es obligatorio';
              },
            ),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'john.doe@gmail.com',
                  labelText: 'Correo electrónico',
                  prefixIcon: Icons.alternate_email_rounded),
              onChanged: (value) => registerForm.email = value,
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = new RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'El valor ingresado no luce como un correo';
              },
            ),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '*****',
                  labelText: 'Contraseña',
                  prefixIcon: Icons.lock_outline),
              onChanged: (value) => registerForm.password = value,
              validator: (value) {
                return (value != null && value.length >= 6)
                    ? null
                    : 'La contraseña debe de ser de 6 caracteres';
              },
            ),
            SizedBox(height: 30),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Color(0xff2E6347),
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    child: Text(
                      registerForm.isLoading ? 'Espere' : 'Crear',
                      style: TextStyle(color: Colors.white),
                    )),
                onPressed: registerForm.isLoading
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();
                        final authService =
                            Provider.of<AuthService>(context, listen: false);

                        if (!registerForm.isValidForm()) return;

                        registerForm.isLoading = true;

                        // TODO: validar si el login es correcto
                        final String? errorMessage =
                            await authService.createUser(
                                registerForm.email, registerForm.password);

                        if (errorMessage == null) {
                          authService.createUserInDB(
                              registerForm.name,
                              registerForm.email,
                              registerForm.address,
                              registerForm.phone);
                          if (!authService.loadingRegistration) {
                            NotificationsService.showSnackbar(
                                authService.responseFromRegistration);
                            registerForm.isLoading = false;
                            Navigator.pushReplacementNamed(context, 'login');
                          }
                        } else {
                          NotificationsService.showSnackbar(errorMessage);
                          registerForm.isLoading = false;
                        }
                      })
          ],
        ),
      ),
    );
  }
}
