import 'package:flutter/material.dart';

class HomeSections extends StatelessWidget {
  static const double NavigationIconSize = 20.0;
  static const double ActionWidgetSize = 60.0;
  static const double ActionIconSize = 35.0;
  static const double ShareActionIconSize = 25.0;
  static const double ProfileIconSize = 50.0;
  static const double ActionIconGap = 12.0;
  static const double FollowActionIconSize = 25.0;
  static const double CreateButtonWidth = 38.0;

  Widget get feedTitleContainer => Container(
          height: 100.0,
          padding: EdgeInsets.only(bottom: 15.0),
          color: Colors.yellow[300],
        );

  Widget get videoDescription =>  Expanded(
    child: Container(color: Colors.green[300]),
  );

  Widget get actionsToolbar => Container(
                  width: 100.0,
                  color: Colors.red[300],
                );

    Widget get navigationBar => Container(
      height: 80.0,
      color: Colors.blue[300]);

  Widget get centerSection => Expanded(child:
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                videoDescription,
                actionsToolbar
              ]));

  Widget get divider =>  Opacity(
            opacity: 0.1,
            child: Container(height: 1.0,
            color: Colors.grey[300]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            feedTitleContainer,
            centerSection,
            // divider,
            navigationBar,
          ],
        ),
      ),
    );
  }
}
