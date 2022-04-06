import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:udea_biosecurity_app/models/models.dart';

class ConfirmationContainerData extends StatelessWidget {
  const ConfirmationContainerData({
    Key? key,
    required this.succesfulInvitationData,
    required this.formatter,
    required this.style,
  }) : super(key: key);

  final Invitation succesfulInvitationData;
  final DateFormat formatter;
  final ButtonStyle style;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
          child: ListView(
            children: [
              ListTile(
                  leading: Icon(Icons.book_online,
                      color: Color(0xff2E6347), size: 40),
                  title: Text(
                    "Reserva confirmada en:",
                  ),
                  subtitle: Text(succesfulInvitationData.place.namePlace)),
              ListTile(
                  title: Text(
                    "Usuario Reserva:",
                  ),
                  subtitle: Text("${succesfulInvitationData.user.name}\n"
                      "${succesfulInvitationData.user.email}\n")),
              ListTile(
                  title: Text(
                    "Horario Reserva:",
                  ),
                  subtitle: Text(
                      "Entrada: ${formatter.format(succesfulInvitationData.inDate)}\n"
                      "Salida: ${formatter.format(succesfulInvitationData.outDate)}\n")),
              ListTile(
                  title: Text(
                    "Datos ubicación:",
                  ),
                  subtitle: Text(
                      "Ubicación: ${succesfulInvitationData.place.address}\n"
                      "Telefono: ${succesfulInvitationData.place.phone}\n")),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                  key: Key("back-button"),
                  style: style,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Volver'),
                ),
                const SizedBox(height: 30, width: 10),
                ElevatedButton(
                  key: Key("book-button"),
                  style: style,
                  onPressed: () => {Navigator.popAndPushNamed(context, 'home')},
                  child: const Text('Volver al listado'),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
