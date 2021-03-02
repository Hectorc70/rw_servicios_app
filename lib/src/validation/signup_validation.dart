/* import 'package:flutter/material.dart';

class FormUser extends StatefulWidget {
  @override
  _FormUserState createState() => _FormUserState();
}

class _FormUserState extends State<FormUser> {
  @override
  Widget build(BuildContext context) {
    final largo = MediaQuery.of(context).size.height;
    final numUser = TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        labelText: "Numero de Telefono",
      ),
    );

    final occupiedBy = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      shadowColor: Colors.black,
      child: TextField(
          obscureText: true,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Ocupado Por",
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(32.0)))),
    );

    final rol = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      shadowColor: Colors.black,
      child: TextField(
          obscureText: true,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Rol",
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(32.0)))),
    );

    final submitButon = Material(
      color: Color.fromARGB(250, 1, 24, 76),
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      shadowColor: Color.fromARGB(250, 1, 24, 76),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'home');
        },
        child: Text(
          "Entrar",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              decoration: TextDecoration.none,
              color: Colors.white),
        ),
      ),
    );

    return ListView(
      children: [
        numUser,
        occupiedBy,
        rol,
        submitButon,
      ],
    );
  }
} */

import 'package:flutter/material.dart';


import 'package:rw_servicios_app/src/validation/validation_item.dart';


class SignupValidation with ChangeNotifier {
  ValidationItem _idUser = ValidationItem(null,null);
  
}
