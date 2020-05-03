import 'package:flutter/material.dart';

class AppDrawerTablet extends StatelessWidget {
  const AppDrawerTablet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        return _AppDrawerPortrait();
      }

      return _AppDrawerLandscape();
    });
  }
}

class _AppDrawerPortrait extends StatelessWidget {
  const _AppDrawerPortrait({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 16, color: Colors.black12),
        ],
      ),
    );
  }
}

class _AppDrawerLandscape extends StatelessWidget {
  const _AppDrawerLandscape({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 16, color: Colors.black12),
        ],
      ),
    );
  }
}
