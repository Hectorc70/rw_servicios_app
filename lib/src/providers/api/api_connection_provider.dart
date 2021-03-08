import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class TokenProvider extends ChangeNotifier {
  String _base = 'https://rwapi.herokuapp.com';
  String _tokenUser;
  String _user;
  String _password;

  Future<String> getToken() async {
    String _tokenURL = _base + '/api-token-auth/';

    final response = await http.post(_tokenURL, body: {
      'username': _user,
      'password': _password,
    });
    if (response.statusCode == 200) {
      final responseDecode = jsonDecode(response.body);
      _tokenUser = responseDecode['token'];

      return '200';

    } else if (response.statusCode == 400) {
      _tokenUser = '';
      return '400';
    } else {
      _tokenUser = '';
      //throw Exception(json.decode(response.body));
      return jsonDecode(response.body);
      
    }
  }

  get tokenUser {
    return _tokenUser;
  }

  set user(String user) {
    this._user = user;

    notifyListeners();
  }

  set password(String password) {
    this._password = password;

    notifyListeners();
  }
}
