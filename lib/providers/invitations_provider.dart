import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:udea_biosecurity_app/models/models.dart';

class InvitationProvider extends ChangeNotifier {
  String _baseUrl = "udea-biosegura.herokuapp.com";
  bool loadingInvitation = false;
  Invitation? createdInvitation;
  final _authService;
  String responseInvitation = "";
  bool succesfulData = false;

  InvitationProvider(this._authService);

  Future<String> _createInvitation(String endpoint, String token, String userId,
      String placeId, String inDate, String outDate) async {
    var url = Uri.http(_baseUrl, endpoint);

    final Map<String, dynamic> invitationData = {
      'userId': userId,
      'placeId': placeId,
      'inDate': inDate,
      'outDate': outDate,
    };

    final response = await http.post(url,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          "Content-Type": "application/json"
        },
        body: json.encode(invitationData));

    switch (response.statusCode) {
      case 201:
        responseInvitation = response.body;
        succesfulData = true;
        notifyListeners();
        return responseInvitation;

      default:
        responseInvitation = 'Error: ${response.body}';
        notifyListeners();
        return responseInvitation;
    }
  }

  createInvitation(String userId, String placeId, int inHour, int inMinutes,
      int outHour, int outMinutes) async {
    loadingInvitation = true;
    succesfulData = false;
    notifyListeners();
    final formatter = new DateFormat('yyyy-MM-dd HH:mm');
    DateTime preuba = DateTime.now();
    DateTime inDate =
        new DateTime(preuba.year, preuba.month, preuba.day, inHour, inMinutes);
    DateTime outDate = new DateTime(
        preuba.year, preuba.month, preuba.day, outHour, outMinutes);
    String formattedInDate = formatter.format(inDate);
    String formattedOutDate = formatter.format(outDate);
    final token = await _authService.readToken();
    final jsonData = await _createInvitation('/api/invitations', token, userId,
        placeId, formattedInDate, formattedOutDate);
    if (succesfulData) {
      final decodedjsonData = jsonDecode(jsonData);

      Invitation invitation = Invitation.fromJson(decodedjsonData);
      createdInvitation = invitation;
      loadingInvitation = false;

      notifyListeners();
    }
    loadingInvitation = false;

    notifyListeners();
  }
}
