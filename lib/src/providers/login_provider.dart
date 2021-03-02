import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:rw_servicios_app/src/providers/api/api_connection_provider.dart';

import 'package:rw_servicios_app/src/services/user_database.dart';
import 'package:rw_servicios_app/src/models/user_model.dart';

class LoginProvider with ChangeNotifier {
  String _user;
  String _password;
  String _token = '62dfd379af87f103c5c94106532bf124fa073111';

  String _base = 'rwapi.herokuapp.com';
  String _url = '/api/user/';

  Future<bool> login() async {
    final urlUser = _base + _url;
    final queryParameters = {
      "id_user": _user,
    };

    final uri = Uri.http(_base, _url, queryParameters);

    final http.Response response = await http.get(
      uri,
      headers: <String, String>{
        'Authorization': 'Token $_token',
      },
    );

    /* body: {'id_user': _user, 'password': _password}, */

    print(json.decode(response.body).toString());

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
