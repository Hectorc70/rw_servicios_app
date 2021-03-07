import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:rw_servicios_app/src/providers/api/api_connection_provider.dart';

import 'package:rw_servicios_app/src/services/user_database.dart';
import 'package:rw_servicios_app/src/models/user_model.dart';

class LoginProvider with ChangeNotifier {
  String _user;
  String _password;
  String _token = 'd4a3822eab690e14e74739ae5dedd638c5ec4848';

  int _rol;
  String _occupiedBy;
  String _base = 'rwapi.herokuapp.com';
  String _url = '/api/user/';

  Future<bool> getDataUser() async {
    final urlUser = _base + _url;
    final queryParameters = {
      "id_user": _user,
    };

    final uri = Uri.http(_base, _url, queryParameters);

    final response = await http.get(
      uri,
      headers: <String, String>{
        'Authorization': 'Token $_token',
      },
    );

    final responseDecode = jsonDecode(response.body);
    for (int i = 0; i < responseDecode.length; i++) {
      if (responseDecode[i]["id_user"] == _user) {
        _rol = responseDecode[i]['rol'];
        _occupiedBy = responseDecode[i]['occupied_by'];
      }
    }

    return true;
  }

  get rol {
    return _rol;
  }

  get occupied {
    return _occupiedBy;
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
