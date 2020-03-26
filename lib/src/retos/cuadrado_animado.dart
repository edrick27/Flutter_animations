import 'package:flutter/material.dart';


class CirculoAnimado extends StatefulWidget {

  @override
  _CirculoAnimadoState createState() => _CirculoAnimadoState();
}

class _CirculoAnimadoState extends State<CirculoAnimado> with SingleTickerProviderStateMixin {

  AnimationController controller;

  // animaciones
   Animation<double> moverDerecha;
   Animation<double> moverArriba;
   Animation<double> moverIzquierda;
   Animation<double> moverBajo;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = new AnimationController(
      vsync: this, 
      duration: Duration(milliseconds: 4000)
    );


    moverDerecha  = Tween(begin: 0.0, end: 300.0).animate(
       CurvedAnimation(parent: controller, curve: Interval(0, 0.25, curve: Curves.bounceOut))
    );

    moverArriba  = Tween(begin: 0.0, end: -200.0).animate(
       CurvedAnimation(parent: controller, curve: Interval(0.25, 0.50, curve: Curves.bounceOut))
    );

    moverIzquierda  = Tween(begin: 0.0, end: 300.0).animate(
       CurvedAnimation(parent: controller, curve: Interval(0.50, 0.75, curve: Curves.bounceOut))
    );

    moverBajo  = Tween(begin: 0.0, end: -200.0).animate(
       CurvedAnimation(parent: controller, curve: Interval(0.75, 1.0, curve: Curves.bounceOut))
    );

     controller.addListener((){

      if( controller.status == AnimationStatus.completed ){

        controller.reset();

      }

    });


  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: GestureDetector(
        onTap: () => controller.forward(),
        child: AnimatedBuilder(
          animation: controller,
          child: _cuadrado(),
          builder: (BuildContext context, Widget cuadrado) {

            double moverX = moverDerecha.value - moverIzquierda.value;
            double moverY = moverArriba.value - moverBajo.value;
            
            return Transform.translate(
              offset: Offset(moverX, moverY),
              child: cuadrado,
            );
        
          },
        )
      )
    );

  }
}

class _cuadrado extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF2AD42A),
        borderRadius: BorderRadius.all(
          Radius.circular(100)
        )
      ),
      height: 100,
      width: 100,
    );
  }
}