import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:udea_biosecurity_app/models/models.dart';
import 'package:udea_biosecurity_app/widgets/confirmation/confirmation_container_data.dart';
import 'package:udea_biosecurity_app/widgets/ui/ui_widgets.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({Key? key, required this.succesfulInvitationData})
      : super(key: key);

  final Invitation succesfulInvitationData;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 15), primary: Color(0xff2E6347));
    final formatter = new DateFormat('yyyy-MM-dd HH:mm');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2E6347),
      ),
      drawer: UiDrawer(
        key: Key("home-drawer"),
      ),
      body: ConfirmationContainerData(
          succesfulInvitationData: succesfulInvitationData,
          formatter: formatter,
          style: style),
    );
  }
}
