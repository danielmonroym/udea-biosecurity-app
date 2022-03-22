import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udea_biosecurity_app/models/models.dart';
import 'package:udea_biosecurity_app/providers/booking_form_provider.dart';

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
  TextEditingController _inputFieldDateController = TextEditingController();
  String _fecha = "";
  @override
  Widget build(BuildContext context) {
    final bookingForm = Provider.of<BookingFormProvider>(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title: Text(widget.place.namePlace),
      content: Container(
        child: Form(
          key: bookingForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextField(
                // autofocus: true,
                enableInteractiveSelection: false,
                controller: _inputFieldDateController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    hintText: "Fecha",
                    labelText: "Fecha",
                    suffixIcon: Icon(Icons.calendar_today),
                    icon: Icon(Icons.calendar_today)),
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  _selectDate(context);
                },
              ),
              SizedBox(height: 30)
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          child: Text('Cancelar'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: Text('OK'),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime.now(),
        lastDate: new DateTime(2023));

    if (picked != null) {
      setState(() {
        _fecha = picked.toIso8601String().toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }
}
