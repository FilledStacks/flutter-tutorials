import 'package:flutter/material.dart';
import 'package:flare_tutorial/smart_flare_animation.dart';

class FlareDemo extends StatefulWidget {
  @override
  _FlareDemoState createState() => _FlareDemoState();
}

class _FlareDemoState extends State<FlareDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 102, 18, 222),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: SmartFlareAnimation()));
  }
}
