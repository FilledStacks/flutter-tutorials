import 'package:flutter/material.dart';

enum LabelType { Bug, Request, General }

class FeedbackLabel extends StatelessWidget {
  final int type;

  FeedbackLabel({@required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.0),
            color: _getLabelColor(_getTypeForType())),
        child: Text(_getLabelName()));
  }

  String _getLabelName() {
    return _getTypeForType().toString().split('.').last;
  }

  LabelType _getTypeForType() {
    switch (type) {
      case 0:
        return LabelType.Bug;
      case 1:
        return LabelType.Request;
      case 2:
        return LabelType.General;
    }

    return LabelType.Bug;
  }

  Color _getLabelColor(LabelType label) {
    switch (label) {
      case LabelType.Bug:
        return Color.fromARGB(255, 202, 9, 9);
      case LabelType.Request:
        return Color.fromARGB(255, 9, 71, 202);
      case LabelType.General:
        return Color.fromARGB(255, 202, 134, 9);
    }

    return null;
  }
}