import 'package:flutter/material.dart';

class ResponsiveOrientationBuilder extends StatelessWidget {
  final Widget landscape;
  final Widget portrait;
  const ResponsiveOrientationBuilder({
    Key key,
    this.landscape,
    @required this.portrait,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          return landscape ?? portrait;
        }

        return portrait;
      },
    );
  }
}
