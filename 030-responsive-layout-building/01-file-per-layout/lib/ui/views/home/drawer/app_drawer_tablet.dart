import 'package:flutter/material.dart';
import 'package:responsive_architecture/ui/sizing_information.dart';

class AppDrawerTablet extends StatelessWidget {
  final SizingInformation sizingInformation;
  const AppDrawerTablet({
    Key key,
    this.sizingInformation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (sizingInformation.orientation == Orientation.portrait) {
      return _AppDrawerPortrait();
    }

    return _AppDrawerLandscape();
  }
}

class _AppDrawerPortrait extends StatelessWidget {
  const _AppDrawerPortrait({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(blurRadius: 16, color: Colors.black12),
      ]),
    );
  }
}

class _AppDrawerLandscape extends StatelessWidget {
  const _AppDrawerLandscape({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(blurRadius: 16, color: Colors.black12),
      ]),
    );
  }
}
