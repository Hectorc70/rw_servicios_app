import 'package:flutter/material.dart';

import 'package:rw_servicios_app/src/pages/home_page.dart';
import 'package:rw_servicios_app/src/pages/login_page.dart';


Map<String, WidgetBuilder> getApplicationRoutes(){
  return <String, WidgetBuilder>{
    '/' :(BuildContext context) => LoginPage(),
    'home':(BuildContext context) => HomePage(),
  }; 

}