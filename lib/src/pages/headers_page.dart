import 'package:disenos_app/src/retos/cuadrado_animado.dart';
import 'package:disenos_app/src/widgets/animation_cuadrado.dart';
import 'package:disenos_app/src/widgets/header_curvo.dart';
import 'package:disenos_app/src/widgets/headers.dart';
import 'package:disenos_app/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class HeadersPage extends StatefulWidget {
  
  @override
  _HeadersPageState createState() => _HeadersPageState();
}

class _HeadersPageState extends State<HeadersPage> {
    double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.purpleAccent,
        onPressed: (){
          porcentaje+= 10;

          if(porcentaje > 100) porcentaje = 0;

          setState(() {});
        }
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            HeaderWave(),
            Positioned(
              top: 10,
              left: 110,
              child: RadialProgress(
                porcentaje: porcentaje,
                color: Color(0xFF2935E4),
              ) 
            ),
            Positioned(
              top: 300,
              child: CuadradoAnimado()
            ),
            Positioned(
              top: 500,
              child: CirculoAnimado()
            )
          ],
        )
      )
    );
  }
}