import 'package:flutter/material.dart';

import 'package:rw_servicios_app/src/pages/login_page.dart';
import 'package:rw_servicios_app/src/routes/routes.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(   
      debugShowCheckedModeBanner: false,
      routes: getApplicationRoutes(),
    );
  }
}


Widget cardArea(){
  
}