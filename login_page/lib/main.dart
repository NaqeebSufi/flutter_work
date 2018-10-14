import 'package:flutter/material.dart';
import 'login.dart';
import 'json.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.blue),
      routes: <String,WidgetBuilder> {
        '/login.dart':(BuildContext context) => new LoginPage(),
        '/json.dart':(BuildContext context) => new StarWarsData()
      },
      home: new LoginPage(),
    );
  }


}