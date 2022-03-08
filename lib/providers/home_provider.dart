import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  List<int> _numbersList = [];
  int _lastItem = 0;
  bool _isLoading = false;

  int get lastItem {
    return _lastItem;
  }

  set lastItem(int value) {
    _lastItem = value;
    notifyListeners();
  }

  List<int> get numbersList {
    return _numbersList;
  }

  set addNumberToList(int value) {
    _numbersList.add(value);
    notifyListeners();
  }

  bool get isLoading {
    return _isLoading;
  }

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void addItems() {
    for (int i = 1; i < 10; i++) {
      _lastItem++;
      _numbersList.add(_lastItem);
    }
  }
}
