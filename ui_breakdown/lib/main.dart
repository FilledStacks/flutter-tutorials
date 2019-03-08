import 'package:flutter/material.dart';
import 'package:ui_breakdown/home.dart';
import 'package:ui_breakdown/home_sections.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white
        ),
        primarySwatch: Colors.blue,
      ),
      home: HomeSections(),
    );
  }
}