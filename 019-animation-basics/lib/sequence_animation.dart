import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class SequenceAnimationView extends StatefulWidget {
  SequenceAnimationView({Key key}) : super(key: key);

  _SequenceAnimationViewState createState() => _SequenceAnimationViewState();
}

class _SequenceAnimationViewState extends State<SequenceAnimationView>
    with TickerProviderStateMixin {
  AnimationController controller;
  SequenceAnimation sequenceAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);
    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 200),
            from: const Duration(milliseconds: 0),
            to: const Duration(milliseconds: 300),
            tag: 'grow')
        .addAnimatable(
            animatable: Tween<double>(begin: 0, end: 1),
            from: const Duration(milliseconds: 0),
            to: const Duration(milliseconds: 400),
            tag: 'fade-in')
        .addAnimatable(
            animatable: Tween<double>(begin: 100, end: 0),
            from: const Duration(milliseconds: 300),
            to: const Duration(milliseconds: 800),
            tag: 'margin-slide')
        .animate(controller);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) => Opacity(
            opacity: sequenceAnimation['fade-in'].value,
            child: Container(
              margin: EdgeInsets.only(
                  left: sequenceAnimation['margin-slide'].value),
              height: sequenceAnimation['grow'].value,
              width: MediaQuery.of(context).size.width,
              color: Colors.purple,
            ),
          ),
        ),
      ),
    );
  }
}
