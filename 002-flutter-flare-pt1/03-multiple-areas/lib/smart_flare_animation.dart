import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flare_flutter/flare_controls.dart';

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
        // color: Colors.red,
        child: GestureDetector(
            onTapUp: (tapInfo) {
              var globalTouchPosition = tapInfo.globalPosition;
              var localTouchPosition = (context.findRenderObject() as RenderBox)
                  .globalToLocal(globalTouchPosition);

              var topHalfTouched = localTouchPosition.dy < AnimationHeight / 2;

              if (localTouchPosition.dx < AnimationWidth / 3 &&
                  topHalfTouched) {
                setAnimationToPlay(AnimationToPlay.CameraTapped);
              } else if (localTouchPosition.dx > AnimationWidth / 3 &&
                  localTouchPosition.dx < (AnimationWidth / 3) * 2 &&
                  topHalfTouched) {
                setAnimationToPlay(AnimationToPlay.PulseTapped);
              } else if (localTouchPosition.dx > (AnimationWidth / 3) * 2 &&
                  topHalfTouched) {
                setAnimationToPlay(AnimationToPlay.ImageTapped);
              } else {
                if (isOpen) {
                  setAnimationToPlay(AnimationToPlay.Deactivate);
                } else {
                  setAnimationToPlay(AnimationToPlay.Activate);
                }

                isOpen = !isOpen;
              }
            },
            child: _getAnimationUI()));
  }

  Widget _getAnimationUI() {
    return FlareActor(
      'assets/button-animation.flr',
      animation: _getAnimationName(_animationToPlay),
      fit: BoxFit.contain,
    );
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

  void setAnimationToPlay(AnimationToPlay animation) {
    setState(() {
      _animationToPlay = animation;
    });
  }
}
