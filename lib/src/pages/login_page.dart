import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rw_servicios_app/src/models/user_model.dart';

import 'package:rw_servicios_app/src/providers/api/api_connection_provider.dart';
import 'package:rw_servicios_app/src/providers/company/company_provider.dart';

import 'package:rw_servicios_app/src/providers/login_provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorPrincipal = Theme.of(context).primaryColor;
    final fondo = _fondo(context);
    /* CustomPaint(
      painter: _HeaderPaintLogin(),
      child: Container(),
    ); */

    final log = _logo(context);

    return Stack(
      children: [
        fondo,
        log,
        SizedBox(
          height: 100.0,
        ),
        FormLogin(),
      ],
    );
  }
}

Widget _fondo(BuildContext context) {
  final fondoG = Container(
    height: double.infinity,
    width: double.infinity,
    decoration: BoxDecoration(color: Colors.white),
  );
  return Stack(
    children: <Widget>[
      fondoG,
      CustomPaint(
        painter: _HeaderPaintLogin(),
        child: Container(),
      ),
    ],
  );
}

class _HeaderPaintLogin extends CustomPainter {
  @override
  paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromARGB(255, 1, 24, 76)
      ..style = PaintingStyle.fill
      ..strokeWidth = 10;
    final pathLogo = Path();
    pathLogo.lineTo(0, size.height / 4);
    pathLogo.lineTo(size.width / 2, size.height / 2.9);
    pathLogo.lineTo(size.width, size.height / 4);
    pathLogo.lineTo(size.width, -size.height / 4);
    canvas.drawPath(pathLogo, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

Widget _logo(BuildContext context) {
  final ancho = MediaQuery.of(context).size.width;
  final largo = MediaQuery.of(context).size.height;

  return Container(
      margin: EdgeInsets.only(top: 50.0),
      width: ancho,
      height: largo / 5,
      alignment: Alignment.topCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: SizedBox()),
          Text(
            'RW',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 90.0,
                decoration: TextDecoration.none,
                color: Colors.white),
          ),
          Text(
            'Servicios',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 25.0,
                decoration: TextDecoration.none,
                color: Colors.white),
          )
        ],
      ));
}

class FormLogin extends StatefulWidget {
  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final myController = TextEditingController();
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //
    final companyInfo = Provider.of<CompanyProvider>(context);
    final token = Provider.of<TokenProvider>(context);
    final userInfo = Provider.of<UserProvider>(context);

    final largo = MediaQuery.of(context).size.height;
    final ancho = MediaQuery.of(context).size.width;
    final colorPrincipal = Theme.of(context).primaryColor;

    final idUserField = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      shadowColor: Colors.black,
      child: TextField(
        controller: myController,
        obscureText: false,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Usuario",
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(32.0))),
        onChanged: (value) {
          token.user = value;
          userInfo.user = value;
        },
      ),
    );

    final password = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      shadowColor: Colors.black,
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Password",
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(32.0))),
        onChanged: (value) => token.password = value,
      ),
    );

    final loginButon = Material(
      color: Color.fromARGB(250, 1, 24, 76),
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      shadowColor: Color.fromARGB(250, 1, 24, 76),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () async {
          final respuestaToken = await token.getToken();

          if (respuestaToken.toString() == '400') {
            _mostrarAlerta(context, 'Informacion Incorrecta',
                'Usuario o Contraseña incorrectos');
          } else if (respuestaToken.toString() == '200') {
            final tokenUserG = token.tokenUser;
            userInfo.tokenUser = tokenUserG;

            await userInfo.getDataUser();

            final rol = userInfo.rol;
            final occupied = userInfo.occupied;

            if (rol == 2) {
              print('rol');
            } else if (rol == 1) {
              companyInfo.rfcCompany = occupied;
              companyInfo.tokenUser = tokenUserG;

              Navigator.pushReplacementNamed(context, 'home-company');
            }
          } else {
            _mostrarAlerta(context, 'Error', respuestaToken.toString());
          }
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

    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
              child: Container(
            height: 200.0,
          )),
          Container(
            width: ancho * .85,
            margin: EdgeInsets.symmetric(vertical: 100.0),
            padding: EdgeInsets.symmetric(vertical: 30.0),
            child: Column(
              children: [
                Material(
                  child: Text(
                    "Iniciar Sesión",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 24.0,
                        color: Color.fromARGB(250, 57, 57, 57)),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                idUserField,
                SizedBox(
                  height: 30.0,
                ),
                password,
                SizedBox(
                  height: 30.0,
                ),
                loginButon,
              ],
            ),
          )
        ],
      ),
    );
  }
}

void _mostrarAlerta(BuildContext context, String titleT, String descripcion) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(titleT),
          content: Text(descripcion),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      });
}

/* 

          
           */

/*  if (rol == 2) {
            print('rol');
          } else if (rol == 1) {
            companyInfo.rfcCompany = occupied;
            Navigator.pushReplacementNamed(context, 'home-company');
          }
 */
/* Navigator.pushReplacementNamed(context, 'home'); */
