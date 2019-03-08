import 'package:flutter/material.dart';
import 'package:tik_tok_ui/tik_tok_icons_icons.dart';

class ActionsToolbar extends StatelessWidget {

  static const double ActionWidgetSize = 60.0;
  static const double ShareActionIconSize = 25.0;
  static const double ActionIconSize = 35.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      padding: EdgeInsets.only(right: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _getSocialAction(icon: TikTokIcons.heart, title: '3.2m'),
          _getSocialAction(icon: TikTokIcons.chat_bubble, title: '16.4k'),
          _getSocialAction(icon: TikTokIcons.reply, title: 'Share', isShare: true),
          ]
      ),
    );
  }

    Widget _getSocialAction({
      String title, 
      IconData icon ,
      bool isShare = false}) {
    return Container(
        margin: EdgeInsets.only(top: 15.0),
        width: ActionWidgetSize, 
        height: ActionWidgetSize,
        child: Column(children: [
          Icon(icon, size: isShare ? ShareActionIconSize : ActionIconSize, color: Colors.grey[300]),
          Padding(
            padding: EdgeInsets.only(top: isShare ? 5.0 : 2.0),
            child: Text(title, style: TextStyle(fontSize: isShare? 10.0:12.0)),
          )
          ]));
  }
}
