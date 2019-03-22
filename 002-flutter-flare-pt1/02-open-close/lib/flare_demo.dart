import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class FlareDemo extends StatefulWidget {
  @override
  _FlareDemoState createState() => _FlareDemoState();
}

class _FlareDemoState extends State<FlareDemo> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple,
        body: GestureDetector(
            onTap: () {
              setState(() {
                isOpen = !isOpen;
              });
            },
            child: FlareActor('assets/button-animation.flr',
                animation: isOpen ? 'activate' : 'deactivate')));
  }
}
