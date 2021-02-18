import 'package:flutter/material.dart';

import 'package:rw_servicios_app/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'C',
      /* theme:  ThemeData(
        brightness: Brightness.light,
        primaryColor: Color.fromARGB(250, 1, 24, 76),
        accentColor: Color.fromARGB(250, 223, 187, 0),
        fontFamily: 'Poppins',

        
      ), */
      debugShowCheckedModeBanner: false,
      routes: getApplicationRoutes(),
    );

    
  }
}


/*  return MultiProvider(  
      providers: [
        Provider(create: (_)=>CompanyInfo()),


      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: getApplicationRoutes(),
        )
    ); */