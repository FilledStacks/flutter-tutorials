import 'package:flutter/material.dart';
import 'package:responsive_architecture/responsive/orientation_layout.dart';
import 'package:responsive_architecture/responsive/screen_type_layout.dart';

class DrawerOption extends StatelessWidget {
  final String title;
  final IconData iconData;
  const DrawerOption({
    Key key,
    this.title,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: _MobilePortrait(
          title: title,
          iconData: iconData,
        ),
        landscape: _MobileLandscape(
          iconData: iconData,
        ),
      ),
      tablet: OrientationLayout(
        portrait: _TabletPortrait(
          title: title,
          iconData: iconData,
        ),
        landscape: _MobilePortrait(
          title: title,
          iconData: iconData,
        ),
      ),
    );
  }
}

class _MobilePortrait extends StatelessWidget {
  final String title;
  final IconData iconData;
  const _MobilePortrait({
    Key key,
    this.title,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25),
      height: 80,
      child: Row(
        children: <Widget>[
          Icon(
            iconData,
            size: 25,
          ),
          SizedBox(
            width: 25,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 21),
          )
        ],
      ),
    );
  }
}

class _MobileLandscape extends StatelessWidget {
  final IconData iconData;
  const _MobileLandscape({Key key, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      alignment: Alignment.center,
      child: Icon(
        iconData,
        size: 30,
      ),
    );
  }
}

class _TabletPortrait extends StatelessWidget {
  final String title;
  final IconData iconData;
  const _TabletPortrait({
    Key key,
    this.title,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 152,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            iconData,
            size: 45,
          ),
          Text(title, style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
