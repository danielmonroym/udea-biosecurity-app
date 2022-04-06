import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  String _baseBackendUrl = "udea-biosegura.herokuapp.com";
  final String _firebaseToken = 'AIzaSyDZ35sR_-RuR2kcWkBTqwec5SjpMibXXIE';

  final storage = new FlutterSecureStorage();

  String responseFromRegistration = "";
  bool loadingRegistration = false;

  // Si retornamos algo, es un error, si no, todo bien!
  Future<String?> createUser(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final url =
        Uri.https(_baseUrl, '/v1/accounts:signUp', {'key': _firebaseToken});

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('idToken')) {
      // Token hay que guardarlo en un lugar seguro
      await storage.write(key: 'token', value: decodedResp['idToken']);
      // decodedResp['idToken'];
      return null;
    } else {
      return decodedResp['error']['message'];
    }
  }

  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final url = Uri.https(
        _baseUrl, '/v1/accounts:signInWithPassword', {'key': _firebaseToken});

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('idToken')) {
      // Token hay que guardarlo en un lugar seguro
      // decodedResp['idToken'];
      await storage.write(key: 'token', value: decodedResp['idToken']);

      return null;
    } else {
      return decodedResp['error']['message'];
    }
  }

  Future logout() async {
    await storage.delete(key: 'token');
    return;
  }

  Future<String> readToken() async {
    return await storage.read(key: 'token') ?? '';
  }

  Future<String> _createUser(String endpoint, String token, String address,
      String phone, String email, String name) async {
    Random random = Random();
    loadingRegistration = true;
    var url = Uri.http(_baseBackendUrl, endpoint);

    final Map<String, dynamic> userData = {
      'idUser': random.nextInt(4294967295).toString(),
      'name': name,
      'phone': phone,
      'email': email,
      'address': address
    };

    final response = await http.post(url,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          "Content-Type": "application/json"
        },
        body: json.encode(userData));
    switch (response.statusCode) {
      case 201:
        responseFromRegistration = "Se ha creado el usuario correctamente!";
        notifyListeners();
        return responseFromRegistration;
      default:
        responseFromRegistration =
            'Error occured while Communication with Server with StatusCode: ${response.statusCode}';
        notifyListeners();
        return responseFromRegistration;
    }
  }

  void createUserInDB(
      String name, String email, String address, String phone) async {
    final token = await readToken();
    final responseFromUserRegister =
        await _createUser('/api/users', token, address, phone, email, name);

    loadingRegistration = false;
    notifyListeners();
  }
}
