import 'package:flutter/material.dart';

class BasicAnimationView extends StatefulWidget {
  BasicAnimationView({Key key}) : super(key: key);

  _BasicAnimationViewState createState() => _BasicAnimationViewState();
}

class _BasicAnimationViewState extends State<BasicAnimationView>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation growAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..addListener(() {
            setState(() {});
          });
    growAnimation = Tween<double>(begin: 0, end: 200).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: growAnimation.value,
          width: growAnimation.value,
          color: Colors.red,
        ),
      ),
    );
  }
}
