import 'package:flutter/material.dart';
import 'package:smart_flare/smart_flare.dart';

class FlareDemo extends StatefulWidget {
  @override
  _FlareDemoState createState() => _FlareDemoState();
}

class _FlareDemoState extends State<FlareDemo> {
  @override
  Widget build(BuildContext context) {
    var animationWidth = 295.0;
    var animationHeight = 251.0;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 102, 18, 222),
        body: Align(
            alignment: Alignment.bottomCenter,
            child: SmartFlareActor(
              width: animationWidth,
              height: animationHeight,
              filename: 'assets/button-animation.flr',
              startingAnimation: 'deactivate',
            )));
  }
}
