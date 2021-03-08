import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:rw_servicios_app/src/models/company/company_model.dart';

class CompanyProvider with ChangeNotifier {
  String _rfc;
  String _base = 'rwapi.herokuapp.com';

  String _token;

  Future<Map> getData() async {
    final queryParameters = {
      "id_user": _rfc,
    };

    String _url = '/api/api-company/$_rfc';
    final uri = Uri.http(_base, _url, queryParameters);
    final response = await http.get(
      uri,
      headers: <String, String>{
        'Authorization': 'Token $_token',
      },
    );

    final responseDecode = jsonDecode(response.body);
  }

  Future<Map> getAreas() async {
    final queryParameters = {
      "id_user": _rfc,
    };

    String _url = '/api/api-area/$_rfc';
    final uri = Uri.http(_base, _url, queryParameters);
    final response = await http.get(
      uri,
      headers: <String, String>{
        'Authorization': 'Token $_token',
      },
    );

    final responseDecode = jsonDecode(response.body);

    print(responseDecode);
  }

  set rfcCompany(String rfc) {
    _rfc = rfc;

    notifyListeners();
  }

  set tokenUser(String tk) {
    _token = tk;
    notifyListeners();
  }
}
