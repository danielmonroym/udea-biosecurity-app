import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:udea_biosecurity_app/models/models.dart';
import 'package:udea_biosecurity_app/services/services.dart';

class UserService extends ChangeNotifier {
  String _baseUrl = "udea-biosegura.herokuapp.com";
  bool loadingUser = false;
  bool succesfulData = false;
  User? obtainedUser;
  String responseUser = "";
  final AuthService _authService;

  UserService(this._authService);

  Future<String> _getJsonDataForUser(String endpoint, String token) async {
    loadingUser = true;
    var url = Uri.http(_baseUrl, endpoint);

    // Await the http get response, then decode the json-formatted response.
    print(url);
    final response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: 'Bearer $token',
    });
    switch (response.statusCode) {
      case 200:
        responseUser = response.body;
        succesfulData = true;
        notifyListeners();
        return responseUser;

      default:
        responseUser =
            'Error occured while Communication with Server with StatusCode: ${response.statusCode}';
        notifyListeners();
        return responseUser;
    }
  }

  getUserFromLogin() async {
    final token = await _authService.readToken();
    final jsonData = await _getJsonDataForUser('/api/users/login', token);

    if (succesfulData) {
      final decodedjsonData = jsonDecode(jsonData);
      User user = User.fromJson(decodedjsonData);
      loadingUser = false;
      obtainedUser = user;
      print(obtainedUser!.email);
      print(obtainedUser!.idUser);
      notifyListeners();
    }
  }
}
