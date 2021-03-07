import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:rw_servicios_app/src/models/company/company_model.dart';

class CompanyProvider with ChangeNotifier {
  String _rfc;
  String _base = 'rwapi.herokuapp.com';
  String _url = '/api/api-company/';
  String _token = 'd4a3822eab690e14e74739ae5dedd638c5ec4848';

  Future<Map> getData() async {
    final queryParameters = {
      "id_user": _rfc,
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
      if (responseDecode[i]["rfc"] == _rfc) {
        /* final company =  Company(); */
        Company.fromDatabaseJson(responseDecode[i]);

        print(Company);
      }
    }
  }

  set rfcCompany(String rfc) {
    _rfc = rfc;

    notifyListeners();
  }
}
