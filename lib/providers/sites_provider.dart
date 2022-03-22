import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:udea_biosecurity_app/models/models.dart';

class SitesProvider extends ChangeNotifier {
  String _baseUrl = "udea-biosegura.herokuapp.com";

  List<Places> places = [];
  List<Places> placesList = [];
  final _authService;
  SitesProvider(this._authService) {
    print('constructor');
    this.getAllPlaces();
  }

  Future<String> _getJsonData(String endpoint, String token) async {
    var url = Uri.https(_baseUrl, endpoint);

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: 'Bearer $token',
    });
    print(response.body);
    return response.body;
  }

  getAllPlaces() async {
    final token = await _authService.readToken();
    final jsonData = await _getJsonData('/api/places', token);
    final decodedData = jsonDecode(jsonData);

    for (Map<String, dynamic> i in decodedData) {
      placesList.add(Places.fromMap(i));
    }

    for (Places i in placesList) {
      print(i.namePlace);
    }
    print(placesList);
    places = [...places, ...placesList];
    notifyListeners();
  }
}
