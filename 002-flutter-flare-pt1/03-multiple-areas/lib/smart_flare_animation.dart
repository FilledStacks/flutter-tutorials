import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

enum AnimationToPlay {
  Activate,
  Deactivate,
  CameraTapped,
  PulseTapped,
  ImageTapped
}

class SmartFlareAnimation extends StatefulWidget {
  _SmartFlareAnimationState createState() => _SmartFlareAnimationState();
}

class _SmartFlareAnimationState extends State<SmartFlareAnimation> {
  static const double AnimationWidth = 295.0;
  static const double AnimationHeight = 251.0;

  bool isOpen = false;

  AnimationToPlay _animationToPlay = AnimationToPlay.Deactivate;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: AnimationWidth,
        height: AnimationHeight,
        child: GestureDetector(
            onTapUp: (tapInfo) {
              var localTouchPosition = (context.findRenderObject() as RenderBox)
                  .globalToLocal(tapInfo.globalPosition);

              var topHalfTouched = localTouchPosition.dy < AnimationHeight / 2;

              var leftSideTouched = localTouchPosition.dx < AnimationWidth / 3;

              var rightSideTouched =
                  localTouchPosition.dx > (AnimationWidth / 3) * 2;

              var middleTouched = !leftSideTouched && !rightSideTouched;

              if (leftSideTouched && topHalfTouched) {
                _setAnimationToPlay(AnimationToPlay.CameraTapped);
              } else if (middleTouched && topHalfTouched) {
                _setAnimationToPlay(AnimationToPlay.PulseTapped);
              } else if (rightSideTouched && topHalfTouched) {
                _setAnimationToPlay(AnimationToPlay.ImageTapped);
              } else {
                if (isOpen) {
                  _setAnimationToPlay(AnimationToPlay.Deactivate);
                } else {
                  _setAnimationToPlay(AnimationToPlay.Activate);
                }

                isOpen = !isOpen;
              }
            },
            child: FlareActor(
              'assets/button-animation.flr',
              animation: _getAnimationName(_animationToPlay),
              fit: BoxFit.contain,
            )));
  }


  String _getAnimationName(AnimationToPlay animationToPlay) {
    switch (animationToPlay) {
      case AnimationToPlay.Activate:
        return 'activate';
      case AnimationToPlay.Deactivate:
        return 'deactivate';
      case AnimationToPlay.CameraTapped:
        return 'camera_tapped';
      case AnimationToPlay.PulseTapped:
        return 'pulse_tapped';
      case AnimationToPlay.ImageTapped:
        return 'image_tapped';
        break;
      default:
        return 'deactivate';
    }
  }

  void _setAnimationToPlay(AnimationToPlay animation) {
    setState(() {
      _animationToPlay = animation;
    });
  }
}
