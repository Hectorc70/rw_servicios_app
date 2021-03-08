

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rw_servicios_app/src/providers/api/api_connection_provider.dart';

import 'package:rw_servicios_app/src/providers/login_provider.dart';
import 'package:rw_servicios_app/src/providers/company/company_provider.dart';

import 'package:rw_servicios_app/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => UserProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => CompanyProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => TokenProvider(),
          )
          
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Color.fromRGBO(1, 24, 76,1)),
          routes: getApplicationRoutes(),
        ));
  }
}
