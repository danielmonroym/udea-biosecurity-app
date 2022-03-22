import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:udea_biosecurity_app/models/models.dart';

class InvitationProvider extends ChangeNotifier {
  String _baseUrl = "udea-biosegura.herokuapp.com";
  bool loadingInvitation = false;
  Invitation? createdInvitation;
  final _authService;

  InvitationProvider(this._authService);

  Future<String> _createInvitation(String endpoint, String token, String userId,
      String placeId, String inDate, String outDate) async {
    loadingInvitation = true;
    var url = Uri.http(_baseUrl, endpoint);

    final Map<String, dynamic> invitationData = {
      'userId': userId,
      'placeId,': placeId,
      'inDate': inDate,
      'outDate': outDate,
    };

    // Await the http get response, then decode the json-formatted response.
    print(url);
    print(invitationData);
    final response = await http.post(url,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          "Content-Type": "application/json"
        },
        body: json.encode(invitationData));

    return response.body;
  }

  createInvitation(
      String userId, String placeId, String inDate, String outDate) async {
    loadingInvitation = true;
    final token = await _authService.readToken();
    final jsonData = await _createInvitation(
        '/api/invitations', token, userId, placeId, inDate, outDate);
    final decodedjsonData = jsonDecode(jsonData);

    Invitation invitation = Invitation.fromJson(decodedjsonData);
    createdInvitation = invitation;
    loadingInvitation = false;
    notifyListeners();
  }
}
