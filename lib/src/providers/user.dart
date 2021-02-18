import 'package:flutter/material.dart';

class U with ChangeNotifier{
  String _companyName = 'PRUEBA';

  get company {
    return _companyName;
  }

  set company(String company) {
    this._companyName = company;

    notifyListeners();
  }
}
