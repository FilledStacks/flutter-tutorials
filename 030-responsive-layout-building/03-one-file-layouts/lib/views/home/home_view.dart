import 'package:flutter/material.dart';
import 'package:responsive_architecture/responsive/responsive_orientation_builder.dart';
import 'package:responsive_architecture/responsive/screentype_builder.dart';
import 'package:responsive_architecture/widgets/drawer/app_drawer.dart';

class HomeView extends StatelessWidget {
  HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeBuilder(
      mobile: ResponsiveOrientationBuilder(
        portrait: _HomeMobilePortrait(),
        landscape: const _HomeMobileLandscape(),
      ),
      tablet: const _HomeTablet(),
    );
  }
}

class _HomeMobilePortrait extends StatelessWidget {
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

class _HomeMobileLandscape extends StatelessWidget {
  const _HomeMobileLandscape({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[AppDrawer()],
      ),
    );
  }
}

class _HomeTablet extends StatelessWidget {
  const _HomeTablet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children = [
      Expanded(
        child: Container(),
      ),
      AppDrawer()
    ];
    return OrientationBuilder(
      builder: (context, orientation) => Scaffold(
        body: orientation == Orientation.portrait
            ? Column(
                children: children,
              )
            : Row(
                children: children.reversed.toList(),
              ),
      ),
    );
  }
}
