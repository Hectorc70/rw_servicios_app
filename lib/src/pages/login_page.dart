import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: _HeaderPaintLogin(),
        ),
      ),
    );
  }
}
Widget
class _HeaderPaintLogin extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromARGB(255, 1, 24, 76)
      ..style = PaintingStyle.fill
      ..strokeWidth = 10;

    final path = Path();
    path.moveTo(0, size.height / 3);
    path.relativeLineTo(size.width / 2, size.height / 6);
    path.relativeLineTo(size.width / 2, -size.height / 6);
    canvas.drawPath(path, paint);

    final pathCuadrado = Path();
    pathCuadrado.lineTo(0, size.height / 3);
    pathCuadrado.lineTo(size.width, size.height/3);
    pathCuadrado.lineTo(size.width, -size.height/3);
    canvas.drawPath(pathCuadrado, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
