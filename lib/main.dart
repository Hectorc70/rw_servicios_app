import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:rw_servicios_app/src/providers/user.dart';
import 'package:rw_servicios_app/src/routes/routes.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MultiProvider(  
      providers: [
        Provider(create: (_)=>CompanyInfo()),


      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: getApplicationRoutes(),
        )
    );
  }
}

