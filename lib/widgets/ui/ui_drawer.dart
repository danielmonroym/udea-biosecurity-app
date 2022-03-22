import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udea_biosecurity_app/services/services.dart';

class UiDrawer extends StatelessWidget {
  const UiDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final userServiceUser = Provider.of<UserService>(context).obtainedUser;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff2E6347),
            ),
            child: Center(
                child: Text('Udea Biosegura App',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white))),
          ),
          SizedBox(height: 30),
          ListTile(
            title: Center(child: const Text('Usuario:')),
            subtitle: Padding(
                padding: const EdgeInsets.all(8.0),
                child: userServiceUser != null
                    ? Column(
                        children: [
                          Center(child: Text(userServiceUser.name)),
                          Center(child: Text(userServiceUser.email)),
                          Center(child: Text(userServiceUser.address)),
                          Center(child: Text(userServiceUser.phone))
                        ],
                      )
                    : Column(
                        children: [],
                      )),
          ),
          ListTile(
            title: Center(child: const Text('Logout')),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              authService.logout();
              Navigator.pushReplacementNamed(context, 'login');
            },
          ),
        ],
      ),
    );
  }
}
