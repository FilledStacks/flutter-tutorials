import 'package:flutter/material.dart';
import 'package:tik_tok_ui/home.dart';
import 'package:tik_tok_ui/home_phase1.dart';
import 'package:tik_tok_ui/home_phase2.dart';
import 'package:tik_tok_ui/home_phase3.dart';
import 'package:tik_tok_ui/home_final.dart';

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
      home: HomePhase3(),
    );
  }
}