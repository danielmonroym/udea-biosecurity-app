// To parse this JSON data, do
//
//     final placesResponse = placesResponseFromMap(jsonString);

import 'dart:convert';

import 'package:udea_biosecurity_app/models/models.dart';

class PlacesResponse {
  PlacesResponse({required this.results});

  List<Places> results;

  factory PlacesResponse.fromJson(String str) =>
      PlacesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PlacesResponse.fromMap(Map<String, dynamic> json) => PlacesResponse(
      results: List<Places>.from(json[""].map((x) => Places.fromMap(x))));

  Map<String, dynamic> toMap() => {
        "results": results,
      };
}
