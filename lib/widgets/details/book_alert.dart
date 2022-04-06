import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udea_biosecurity_app/models/models.dart';
import 'package:udea_biosecurity_app/providers/booking_form_provider.dart';
import 'package:udea_biosecurity_app/providers/invitations_provider.dart';
import 'package:udea_biosecurity_app/services/services.dart';

class BookAlert extends StatefulWidget {
  BookAlert({
    Key? key,
    required this.place,
  }) : super(key: key);

  final Places place;

  @override
  _BookAlertState createState() => _BookAlertState();
}

class _BookAlertState extends State<BookAlert> {
  TextEditingController _inputFieldDateController1 = TextEditingController();
  TextEditingController _inputFieldDateController2 = TextEditingController();
  String _date1 = "";
  int _hour1 = 0;
  int _minutes1 = 0;
  String _date2 = "";
  int _hour2 = 0;
  int _minutes2 = 0;
  GlobalKey<FormState> keyFormState =
      GlobalKey<FormState>(debugLabel: '_bookScreenkey');
  @override
  Widget build(BuildContext context) {
    BookingFormProvider bookingForm = Provider.of<BookingFormProvider>(context);
    keyFormState = bookingForm.formKey;
    final invitationProvider = Provider.of<InvitationProvider>(context);
    final userService = Provider.of<UserService>(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.book_online, color: Color(0xff2E6347), size: 40),
          SizedBox(height: 10),
          Text("Reservar en: ${widget.place.namePlace}"),
          SizedBox(height: 20),
          Text(
            "Horario disponible: ${widget.place.checkIn} - ${widget.place.checkOut}",
            overflow: TextOverflow.clip,
          ),
        ],
      ),
      content: bookingForm.isLoading
          ? Center(
              child: CircularProgressIndicator(color: Color(0xff2E6347)),
            )
          : bookAlertData(
              keyFormState,
              bookingForm,
              context,
              invitationProvider,
              userService,
            ),
      actions: [
        TextButton(
          child: Text('Cancelar'),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  }

  Container bookAlertData(
      GlobalKey<FormState> keyFormState,
      BookingFormProvider bookingForm,
      BuildContext context,
      InvitationProvider invitationProvider,
      UserService userService) {
    return Container(
      width: 500,
      child: Form(
        key: keyFormState,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              // autofocus: true,
              enableInteractiveSelection: false,
              controller: _inputFieldDateController1,

              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  hintText: "Hora de entrada",
                  labelText: "Hora de entrada",
                  suffixIcon: Icon(Icons.calendar_today),
                  icon: Icon(Icons.calendar_today)),
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
                selectFirstHour(context);
              },
              validator: (value) {
                if (value == null || value.length < 1)
                  return 'La hora de entrada es obligatoria';
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              // autofocus: true,
              enableInteractiveSelection: false,
              controller: _inputFieldDateController2,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  hintText: "Hora de salida",
                  labelText: "Hora de salida",
                  suffixIcon: Icon(Icons.calendar_today),
                  icon: Icon(Icons.calendar_today)),
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
                selectSecondHour(context);
              },

              validator: (value) {
                if (value == null || value.length < 1)
                  return 'La hora de salida es obligatoria';
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
                      bookingForm.isLoading ? 'Espere' : 'Reservar',
                      style: TextStyle(color: Colors.white),
                    )),
                onPressed: bookingForm.isLoading
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();

                        if (!bookingForm.isValidForm()) return;

                        bookingForm.isLoading = true;

                        await invitationProvider.createInvitation(
                            userService.obtainedUser!.idUser,
                            widget.place.idPlace,
                            _hour1,
                            _minutes1,
                            _hour2,
                            _minutes2);

                        if (invitationProvider.succesfulData) {
                          bookingForm.isLoading = false;
                          if (invitationProvider.createdInvitation != null &&
                              !invitationProvider.loadingInvitation) {
                            Navigator.popAndPushNamed(context, 'confirmation',
                                arguments:
                                    invitationProvider.createdInvitation);
                          }
                        } else {
                          bookingForm.isLoading = false;
                          _showAlert(
                              context, invitationProvider.responseInvitation);
                        }
                      })
          ],
        ),
      ),
    );
  }

  void selectFirstHour(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        _date1 = picked.format(context);
        _hour1 = picked.hour;
        _minutes1 = picked.minute;
        _inputFieldDateController1.text = _date1;
      });
    }
  }

  void selectSecondHour(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        _date2 = picked.format(context);
        _hour2 = picked.hour;
        _minutes2 = picked.minute;
        _inputFieldDateController2.text = _date2;
      });
    }
  }

  _showAlert(context, String errorResponse) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(errorResponse),
        );
      },
      barrierDismissible: true,
    );
  }
}
