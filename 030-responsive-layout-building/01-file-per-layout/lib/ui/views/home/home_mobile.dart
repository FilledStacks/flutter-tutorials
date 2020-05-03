import 'package:flutter/material.dart';
import 'package:responsive_architecture/ui/views/home/drawer/app_drawer.dart';

import '../../sizing_information.dart';

class HomeMobile extends StatelessWidget {
  final SizingInformation sizingInformation;
  HomeMobile({
    Key key,
    @required this.sizingInformation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (sizingInformation.orientation == Orientation.portrait) {
      return _HomePortrait();
    }

    return _HomeLandscape();
  }
}

class _HomePortrait extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                size: 30,
              ),
              onPressed: () {
                _scaffoldKey.currentState.openDrawer();
              },
            ),
          )
        ],
      ),
    );
  }
}

class _HomeLandscape extends StatelessWidget {
  const _HomeLandscape({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[AppDrawer()],
      ),
    );
  }
}
