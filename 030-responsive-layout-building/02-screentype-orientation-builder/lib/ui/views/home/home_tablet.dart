import 'package:flutter/material.dart';
import 'package:responsive_architecture/ui/widgets/drawer/app_drawer.dart';

class HomeTablet extends StatelessWidget {
  HomeTablet({
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
