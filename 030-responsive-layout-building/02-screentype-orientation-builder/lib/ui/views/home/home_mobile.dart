import 'package:flutter/material.dart';
import 'package:responsive_architecture/ui/widgets/drawer/app_drawer.dart';

class HomeMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return _HomePortrait();
        }

        return _HomeLandscape();
      },
    );
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
