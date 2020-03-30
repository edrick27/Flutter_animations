import 'package:disenos_app/src/pages/graficas_cirulares_page.dart';
import 'package:disenos_app/src/pages/headers_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños APP',
      home: HeadersPage()
    );
  }

}