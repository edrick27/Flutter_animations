import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  

  final porcentaje;
  final Color color;


  const RadialProgress({
    @required this.porcentaje, 
    this.color = Colors.blue
  });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {
  
  AnimationController controller;
  double porcentajeAnterior;

  @override
  void initState() {

    porcentajeAnterior = widget.porcentaje;

    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    controller.addListener((){ });

    super.initState();
  }

  @override
  void dispose() { 
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    controller.forward(from: 0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {

        final valorAnimar = ( widget.porcentaje - diferenciaAnimar ) + ( diferenciaAnimar * controller.value );
        
        return Container(
          padding: EdgeInsets.all(10),
          child: Stack(
            children: <Widget>[
              Center(
                child: Container(
                  width:  150,
                  height: 150,
                  child: CustomPaint(
                    painter: _MiRadialProgress(valorAnimar, widget.color, widget.porcentaje)
                  ),
                ),
              ),
              // Center(
              //   child: Text(
              //     "${widget.porcentaje} %",
              //     style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              //   )
              // )
            ]
          )
        );

      },
    );
    
  }
}

class _MiRadialProgress extends CustomPainter {
  
  double _porcentaje;
  double _porcentajeFinal;
  Color _color;

  _MiRadialProgress(this._porcentaje, this._color, this._porcentajeFinal);

  @override
  void paint(Canvas canvas, Size size) {
    //circulo
    final paint = new Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    Offset center = new Offset(size.width * 0.5, size.height * 0.5);

    double radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    //arco
    final paintArc = new Paint()
      ..strokeWidth = 10
      ..color = _color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    //parte que se va a llenar
    double arcAngle = 2 * pi * (_porcentaje / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle, 
      false, 
      paintArc
    );
        

    final paragraphStyle = new ui.ParagraphStyle(
      fontSize: 30.0,
      textAlign: TextAlign.center,
      fontWeight: FontWeight.w500
    );

    final paragraphBuilder = new ui.ParagraphBuilder(paragraphStyle)
      ..pushStyle(new ui.TextStyle(color: _color))
      ..addText('$_porcentajeFinal %');

    final paragraph = paragraphBuilder.build();
    paragraph.layout(new ui.ParagraphConstraints(width: size.width));

    final offset1 = new Offset(size.width * 0.05, size.height * 0.4);
    canvas.drawParagraph(paragraph, offset1);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
