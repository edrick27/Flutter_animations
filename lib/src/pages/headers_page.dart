import 'package:disenos_app/src/retos/cuadrado_animado.dart';
import 'package:disenos_app/src/widgets/animation_cuadrado.dart';
import 'package:disenos_app/src/widgets/header_curvo.dart';
import 'package:disenos_app/src/widgets/headers.dart';
import 'package:flutter/material.dart';

class HeadersPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            HeaderWave(),
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