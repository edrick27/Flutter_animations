import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin {
 
  double porcentaje = 0.0;
  double nuevoPorcentaje = 0.0;
  AnimationController controller;
 

  @override
  void initState() {

    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    controller.addListener((){

      print("valor del controlador ${ controller.value }");

      setState(() {
            porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, controller.value);
      });

    });

    super.initState();
  }

  @override
  void dispose() { 
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.purpleAccent,
        onPressed: (){

          nuevoPorcentaje += 10;
          porcentaje = nuevoPorcentaje;
          
          if (nuevoPorcentaje > 100) {
            nuevoPorcentaje = 0;
            porcentaje = 0;
          }

          controller.forward(from: 0.0);

          setState(() {});
         
        }
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                width: 300,
                height: 300,
                child: CustomPaint(
                  painter: _MiRadialProgress(porcentaje)
                ),
              ),
            ),
            Center(
              child: Text(
                "$nuevoPorcentaje %",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500
                ),
              )
            )
          ] 
        ),
      )
    );
  }

}

class _MiRadialProgress extends CustomPainter {

  double _porcentaje; 

  _MiRadialProgress(this._porcentaje);

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint


    //circulo
    final paint = new Paint()
      ..strokeWidth = 4
      ..color       = Colors.grey
      ..style       = PaintingStyle.stroke;

    Offset center = new Offset(size.width  * 0.5, size.height  * 0.5);

    double radius = min(size.width  * 0.5 , size.height  * 0.5);

    canvas.drawCircle(center, radius, paint);

    //arco
    final paintArc = new Paint()
      ..strokeWidth = 10
      ..color       = Colors.blueAccent
      ..style       = PaintingStyle.stroke;

    //parte que se va a llenar
    double arcAngle = 2 * pi * ( _porcentaje / 100 );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius), 
      -pi / 2, 
      arcAngle, 
      false, 
      paintArc
    );



  }
  

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;


}