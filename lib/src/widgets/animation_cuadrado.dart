import 'package:flutter/material.dart';
import 'dart:math' as Math;

class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}


class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin {

  AnimationController controller;

  Animation<double> rotacion;
  Animation<double> opacidad;
  Animation<double> opacidadOut;
  Animation<double> moverderecha;
  Animation<double> agrandar;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = new AnimationController(
      vsync: this, 
      duration: Duration(milliseconds: 4000)
    );

    rotacion = Tween(begin: 0.0, end: 2 * Math.pi ).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOutBack)
    );

    opacidad  = Tween(begin: 0.3, end: 1.0).animate(
       CurvedAnimation(parent: controller, curve: Interval(0, 0.25, curve: Curves.easeOut))
    );

    opacidadOut  = Tween(begin: 1.0, end: 0.0).animate(
       CurvedAnimation(parent: controller, curve: Interval(0.75, 1.0, curve: Curves.decelerate))
    );

    moverderecha  = Tween(begin: 0.0, end: 200.0).animate(
       CurvedAnimation(parent: controller, curve: Interval(0, 0.5, curve: Curves.easeOut))
    );

    agrandar  = Tween(begin: 0.2, end: 1.5).animate(
       CurvedAnimation(parent: controller, curve: Curves.easeOut)
    );

    controller.addListener((){

      print('status ${ controller.status }');

      if( controller.status == AnimationStatus.completed ){

        controller.reverse();
        // controller.reset();

      }

    });

  }

  @override
  void dispose() { 
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: (){
          controller.forward();
        },
        child: AnimatedBuilder(
          animation: controller,
          child: _cuadrado(),
          builder: (BuildContext context, Widget cuadrado) {

            print("rotacion: " + rotacion.value.toString());

            return Transform.translate(
              offset: Offset(moverderecha.value, 0),
              child: Transform.rotate(
                angle: rotacion.value,
                child: Opacity(
                  opacity: opacidad.value,
                  child: Opacity(
                    opacity: opacidadOut.value,
                    child: Transform.scale(
                      scale: agrandar.value,
                      child: cuadrado
                    ),
                  )
                )
              ),
            );

          },
        ),
      )
    );
  }
}

class _cuadrado extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      color: Color(0xFF9D55FC),
    );
  }
}