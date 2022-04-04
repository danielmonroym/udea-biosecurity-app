import 'package:flutter/material.dart';
import 'package:udea_biosecurity_app/models/models.dart';
import 'package:udea_biosecurity_app/widgets/ui/ui_widgets.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({Key? key, required this.succesfulInvitationData})
      : super(key: key);

  final Invitation succesfulInvitationData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2E6347),
      ),
      drawer: UiDrawer(
        key: Key("home-drawer"),
      ),
      body: Container(
        child: Column(
          children: [Text(succesfulInvitationData.user.email)],
        ),
      ),
    );
  }
}
