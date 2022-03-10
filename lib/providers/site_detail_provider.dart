import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:udea_biosecurity_app/models/models.dart';

class SiteDetailProvider extends ChangeNotifier {
  String _baseUrl = "udea-biosegura.herokuapp.com";
  bool loadingPlace = false;
  Places? obtainedPlace;

  Future<String> _getJsonDataForPlace(String endpoint) async {
    loadingPlace = true;
    var url = Uri.https(_baseUrl, endpoint);

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    print(response.body);
    return response.body;
  }

  getPlaceById(id) async {
    final jsonData = await _getJsonDataForPlace('/api/places/$id');
    final decodedjsonData = jsonDecode(jsonData);

    Places place = Places.fromJson(decodedjsonData);
    loadingPlace = false;
    obtainedPlace = place;
    notifyListeners();
  }
}
