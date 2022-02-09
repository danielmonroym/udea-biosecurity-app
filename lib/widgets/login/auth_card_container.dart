import 'package:flutter/material.dart';

class AuthCardContainer extends StatelessWidget {
  final Widget child;

  const AuthCardContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: _createCardShape(),
        child: this.child,
      ),
    );
  }

  BoxDecoration _createCardShape() => BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
      boxShadow: [_createBoxShadow()]);

  BoxShadow _createBoxShadow() =>
      BoxShadow(color: Colors.black12, blurRadius: 15, offset: Offset(0, 5));
}
