import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static const double NavigationIconSize = 35.0;
  static const double ActionWidgetSize = 60.0;
  static const double ActionIconSize = 45.0;
  static const double ProfileIconSize = 50.0;
  static const double ActionIconGap = 12.0;
  static const double FollowActionIconSize = 25.0;

  Widget get followingContainer => Container(
          height: 100.0,
          padding: EdgeInsets.only(bottom: 15.0),
          alignment: Alignment(0.0, 1.0),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Following'),
                Container(
                  width: 15.0,
                ),
                Text('For you',
                    style: TextStyle(
                        fontSize: 17.0, fontWeight: FontWeight.bold))
              ]),
        );

  Widget get videoDescription =>  Expanded(child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Text('Test text'),
                  Text('Test text'),
                  Text('Test text'),
                  Text('Test text'),
                  Text('Test text'),
                ]));

  Widget get centerSection => Expanded(child:
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                videoDescription,
                Container(
                  width: 100.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      _getProfileVideoAction(),
                      _getVideoAction(title: '3.2m', icon: Icons.favorite),
                      _getVideoAction(title: '16.4k', icon: Icons.chat_bubble),
                      _getVideoAction(title: 'Share', icon: Icons.reply),
                      _getVideoAction(title: '3.2m'),
   
                    ],
                  ),
                )
              ]));

  Widget get navigationBar => Padding(
    padding: EdgeInsets.only(top: 15.0),
    child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.home, color: Colors.white, size: NavigationIconSize),
                Icon(Icons.search,
                    color: Colors.white, size: NavigationIconSize),
                Icon(Icons.add_box,
                    color: Colors.white, size: NavigationIconSize),
                Icon(Icons.message,
                    color: Colors.white, size: NavigationIconSize),
                Icon(Icons.person,
                    color: Colors.white, size: NavigationIconSize)
              ],
            ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            followingContainer,
            centerSection,
            navigationBar,
          ],
        ),
      ),
    );
  }

  Widget _getVideoAction({
    String title, 
    IconData icon}) {
    return Container(
        margin: EdgeInsets.only(top: 10.0),
        width: ActionWidgetSize, 
        height: ActionWidgetSize,
        child: Column(children: [
          Icon(icon, size: ActionIconSize, color: Colors.grey[300]),
          Text(title, style: TextStyle(fontSize: 12.0),)
          ]));
  }

  Widget _getProfileVideoAction({
    String pictureUrl}) {
    return Stack( children: [Container(
        margin: EdgeInsets.only(top: 10.0),
        width: ActionWidgetSize, 
        height: ActionWidgetSize,
        child: Column(children: [
          Container(
            height: ProfileIconSize, 
            width: ProfileIconSize,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(ProfileIconSize / 2)
            ),
          ),
          
          ])), 
           Positioned(
            width: 15.0,
            height: 15.0,
            bottom: 5,
            left: ((ActionWidgetSize / 2) - (15 / 2)),
            child: Container(decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15.0)),)),
           Positioned(
            bottom: 0,
            left: ((ActionWidgetSize / 2) - (FollowActionIconSize / 2)),
            child: Icon(Icons.add_circle, color: Colors.red, size: FollowActionIconSize))
          
          ]);
  }
}
