import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xFF00FFFF),
    );
  }

}

class HeaderBordesRedondeados extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        // color: Color(0xFF50F9FF),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70)
        )
      ),
    );
  }

}

class HeaderDiagonal extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Color(0xFF00FFFF),
      child: CustomPaint(
        painter: _headerDiagonalPainter(),
      ),
    );
  }

}

class HeaderTriangular extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Color(0xFF0077FF),
      child: CustomPaint(
        painter: _headerTriangularPainter(),
      ),
    );
  }

}

class HeaderPico extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Color(0xFF0077FF),
      child: CustomPaint(
        painter: _headerPicoPainter(),
      ),
    );
  }

}

class _headerDiagonalPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    
    final paint = Paint();

    // Propiedades
    paint.color = Color(0xFF8E23A3);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    final path = Path();

    // dibujar con el path y el lapiz

    path.moveTo(0, size.height * 0.5 );
    path.lineTo(size.width, size.height * 0.3  );
    path.lineTo(size.width, 0 );
    path.lineTo(0, 0 );


    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }



}

class _headerTriangularPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    
    final paint = Paint();

    // Propiedades
    paint.color = Color(0xFFD88922);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    final path = Path();

    // dibujar con el path y el lapiz

    path.moveTo(size.width, size.height);
    path.lineTo(size.width,  0 );
    path.lineTo(0, 0 );


    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}

class _headerPicoPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    
    final paint = Paint();

    // Propiedades
    paint.color = Color(0xFF31D822);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    final path = Path();

    // dibujar con el path y el lapiz

    path.lineTo(0, size.height * 0.2);
    path.lineTo(size.width * 0.5, size.height * 0.28);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width,  0 );
    path.lineTo(0,  0 );


    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}