import 'package:flutter/material.dart';
import 'package:responsive_architecture/responsive/responsive_orientation_builder.dart';
import 'package:responsive_architecture/responsive/screentype_builder.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeBuilder(
      mobile: _AppDrawerMobile(),
      tablet: ResponsiveOrientationBuilder(
        portrait: const _AppDrawerTabletPortrait(),
        landscape: const _AppDrawerTabletLandscape(),
      ),
    );
  }
}

class _AppDrawerMobile extends StatelessWidget {
  const _AppDrawerMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => Container(
        width: orientation == Orientation.landscape ? 100 : 250,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 16, color: Colors.black12),
          ],
        ),
      ),
    );
  }
}

class _AppDrawerTabletPortrait extends StatelessWidget {
  const _AppDrawerTabletPortrait({Key key}) : super(key: key);

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

class _AppDrawerTabletLandscape extends StatelessWidget {
  const _AppDrawerTabletLandscape({Key key}) : super(key: key);

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
