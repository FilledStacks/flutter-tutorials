import 'package:flutter/material.dart';
import 'package:responsive_architecture/ui/sizing_information.dart';
import 'package:responsive_architecture/ui/views/home/drawer/app_drawer.dart';

class HomeTablet extends StatelessWidget {
  final SizingInformation sizingInformation;
  HomeTablet({
    Key key,
    this.sizingInformation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children = [
      Expanded(
        child: Container(),
      ),
      AppDrawer()
    ];
    return Scaffold(
      body: sizingInformation.orientation == Orientation.portrait
          ? Column(
              children: children,
            )
          : Row(
              children: children.reversed.toList(),
            ),
    );
  }
}
