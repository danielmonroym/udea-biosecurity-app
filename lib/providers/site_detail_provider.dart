import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:udea_biosecurity_app/models/models.dart';

class SiteDetailProvider extends ChangeNotifier {
  String _baseUrl = "udea-biosegura.herokuapp.com";
  bool loadingPlace = false;
  Places? obtainedPlace;
  final _authService;

  SiteDetailProvider(this._authService);

  Future<String> _getJsonDataForPlace(String endpoint, String token) async {
    loadingPlace = true;
    var url = Uri.https(_baseUrl, endpoint);

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: 'Bearer $token',
    });
    print(response.body);
    return response.body;
  }

  getPlaceById(id) async {
    final token = await _authService.readToken();
    final jsonData = await _getJsonDataForPlace('/api/places/$id', token);
    final decodedjsonData = jsonDecode(jsonData);

    Places place = Places.fromJson(decodedjsonData);
    loadingPlace = false;
    obtainedPlace = place;
    notifyListeners();
  }
}
