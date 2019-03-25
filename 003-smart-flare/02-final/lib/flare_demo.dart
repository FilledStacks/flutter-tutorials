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
    var animationWidthThirds = animationWidth / 3;
    var halfAnimationHeight =animationHeight / 2;

    var activeAreas = [

      ActiveArea(
        area: Rect.fromLTWH(0, 0, 
        animationWidthThirds, 
        halfAnimationHeight),
        debugArea: true,
        guardComingFrom: ['deactivate'],
        animationName: 'camera_tapped'),

        ActiveArea(
        area: Rect.fromLTWH(
          animationWidthThirds, 0, 
        animationWidthThirds, 
        halfAnimationHeight),
        debugArea: true,
        guardComingFrom: ['deactivate'],
        animationName: 'pulse_tapped'),

        ActiveArea(
        area: Rect.fromLTWH(
          animationWidthThirds * 2, 0, 
        animationWidthThirds, 
        halfAnimationHeight),
        debugArea: true,
        guardComingFrom: ['deactivate'],
        animationName: 'image_tapped'),

      ActiveArea(
        area: Rect.fromLTWH(
          0, 
          animationHeight/2, 
          animationWidth, 
          animationHeight/2),
          debugArea: true,
          animationsToCycle: ['activate', 'deactivate'],
          onAreaTapped: () {
            print('Button tapped!');
          })
    ];


    return Scaffold(
        backgroundColor: Color.fromARGB(255, 102, 18, 222),
        body: Align(
            alignment: Alignment.bottomCenter,
            child: SmartFlareActor(
              width: animationWidth,
              height: animationHeight,
              filename: 'assets/button-animation.flr',
              startingAnimation: 'deactivate',
              activeAreas: activeAreas,
            )));
  }
}
