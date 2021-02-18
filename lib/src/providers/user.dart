import 'package:flutter/material.dart';

class U with ChangeNotifier{
  String _company_name = 'PRUEBA';

  get company {
    return _company_name;
  }

  set company(String company) {
    this._company_name = company;

    notifyListeners();
  }
}
