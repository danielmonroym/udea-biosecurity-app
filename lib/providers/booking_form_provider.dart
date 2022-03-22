import 'package:flutter/material.dart';

class BookingFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String inDate = '';
  String outDate = '';

  bool _isLoading = false;

  bool get isLoading {
    return _isLoading;
  }

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(formKey.currentState?.validate());
    print('$inDate - $outDate');
    return formKey.currentState?.validate() ?? false;
  }
}
