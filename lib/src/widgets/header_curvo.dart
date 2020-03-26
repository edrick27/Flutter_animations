import 'package:flutter/material.dart';

class HeaderCurvo extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Color(0xFFD1CFCF),
      child: CustomPaint(
        painter: _headerCurvoPainter(),
      ),
    );
  }

}

class HeaderWave extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Color(0xFFD1CFCF),
      child: CustomPaint(
        painter: _headerWavePainter(),
      ),
    );
  }

}


class _headerCurvoPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    
    final paint = Paint();

    // Propiedades
    paint.color = Color(0xFF8E23A3);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();

    // dibujar con el path y el lapiz

    path.lineTo(0, size.height * 0.25 );
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.15, size.width, size.height * 0.25);
    // path.quadraticBezierTo(size.width * 0.5, size.height * 0.42, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);


    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}

class _headerWavePainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    
    final paint = Paint();

    // Propiedades
    paint.color = Color(0xFF0EC5F3);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();

    // dibujar con el path y el lapiz

    path.lineTo(0, size.height * 0.25 );
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30, size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.80, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);


    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}
