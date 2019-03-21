import 'package:flutter/material.dart';
import 'package:tik_tok_ui/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTokUI',
      home: Home(),
    );
  }
}