import 'package:flutter/material.dart';
import 'package:rw_servicios_app/src/pages/company/home_company_page.dart';


import 'package:rw_servicios_app/src/pages/login_page.dart';

import 'package:rw_servicios_app/src/pages/admin/home_page_admin.dart';
import 'package:rw_servicios_app/src/pages/admin/add_usuario_page.dart';



Map<String, WidgetBuilder> getApplicationRoutes(){
  return <String, WidgetBuilder>{
    '/' :(BuildContext context) => LoginPage(),
    'home':(BuildContext context) => HomePageAdmin(),
    'home-company':(BuildContext context) => HomePageCompany(),
    'add-user':(BuildContext context) => AddUserPage(),
    /* 'home':(BuildContext context) => HomePage(), */
  }; 

}