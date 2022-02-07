import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [_GreenBox(), _HeaderIcon(), this.child],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 30),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('lib/assets/no-image.jpg'),
              image: AssetImage('lib/assets/udea.png'),
              width: 500,
              height: 300,
            ),
          )),
    );
  }
}

class _GreenBox extends StatelessWidget {
  const _GreenBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        width: double.infinity,
        height: size.height * 0.4,
        decoration: _greenBackground());
  }

  BoxDecoration _greenBackground() => BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(46, 99, 71, 1),
        Color.fromRGBO(124, 218, 56, 1),
      ]));
}
