import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'authentication.dart';
import 'rootpage.dart';
import 'authentication.dart';
import 'package:draw/draw.dart';

 void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Login Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new RootPage(auth: new Auth()));
  }
}