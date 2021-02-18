import 'package:flutter/material.dart';



class LoginPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    


    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            CustomPaint(
              painter: _HeaderPaintLogin(),
              child: Container(),
            ),
            logo(context),
            FormLogin(),
          ],
        ),
      ),
    );
  }
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

logo(BuildContext context) {
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
  @override
  Widget build(BuildContext context) {
    final largo = MediaQuery.of(context).size.height;
    final ancho = MediaQuery.of(context).size.width;

    final idUserField = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      shadowColor: Colors.black,
      child: TextField(
          obscureText: false,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Usuario",
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,

                  borderRadius: BorderRadius.circular(32.0)))),
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
                  borderRadius: BorderRadius.circular(32.0)))),
    );

    final loginButon = Material(
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
              color: Colors.white
              ),
        ),
      ),
    );

    return Container(
      height:largo/3,      
      margin: EdgeInsets.fromLTRB(0, largo/2.7, 0, 0),
      color: Colors.amber,
      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
      child: Column(
        children: [          
          Text(
            "Iniciar Sesión",
            style: TextStyle(
                fontFamily: "Poppins",
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
                color: Color.fromARGB(250, 57, 57, 57)),
          ),
          SizedBox(
            height: 20.0,
          ),
          idUserField,
          SizedBox(
            height: 20.0,
          ),
          password,
          SizedBox(
            height: 20.0,
          ),
          loginButon,
        ],
      ),
    );
  }
}
