import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:tik_tok_ui/tik_tok_icons_icons.dart';

class ActionsToolbar extends StatelessWidget {
  // Full dimensions of an action
  static const double ActionWidgetSize = 60.0;

// The size of the icon showen for Social Actions
  static const double ActionIconSize = 35.0;

// The size of the share social icon
  static const double ShareActionIconSize = 25.0;

// The size of the profile image in the follow Action
  static const double ProfileImageSize = 50.0;

// The size of the plus icon under the profile image in follow action
  static const double PlusIconSize = 20.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        _getFollowAction(),
        _getSocialAction(icon: TikTokIcons.heart, title: '3.2m'),
        _getSocialAction(icon: TikTokIcons.chat_bubble, title: '16.4k'),
        _getSocialAction(icon: TikTokIcons.reply, title: 'Share', isShare: true),
        _getMusicPlayerAction()
      ]),
    );
  }

  Widget _getSocialAction({String title, IconData icon, bool isShare = false}) {
    return Container(
        margin: EdgeInsets.only(top: 15.0),
        width: 60.0,
        height: 60.0,
        child: Column(children: [
          Icon(icon, size: isShare ? 25.0 : 35.0, color: Colors.grey[300]),
          Padding(
            padding: EdgeInsets.only(top: isShare ? 5.0 : 2.0),
            child:
                Text(title, style: TextStyle(fontSize: isShare ? 10.0 : 12.0)),
          )
        ]));
  }

  Widget _getFollowAction({String pictureUrl}) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        width: 60.0,
        height: 60.0,
        child: Stack(children: [_getProfilePicture(), _getPlusIcon()]));
  }

  Widget _getPlusIcon() {
   return Positioned(
        bottom: 0,
        left: ((ActionWidgetSize / 2) - (PlusIconSize / 2)),
        child: Container(
          width: PlusIconSize,  // PlusIconSize = 20.0;
          height: PlusIconSize, // PlusIconSize = 20.0;
          decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 43, 84),
          borderRadius: BorderRadius.circular(15.0)
          ),
          child: Icon(Icons.add, color: Colors.white, size: 20.0, )),);
 }

 Widget _getProfilePicture() {
   return Positioned(
     left: (ActionWidgetSize / 2) - (ProfileImageSize / 2),
     child: Container(
        padding: EdgeInsets.all(1.0), // Add 1.0 point padding to create border
        height: ProfileImageSize, // ProfileImageSize = 50.0;
        width: ProfileImageSize, // ProfileImageSize = 50.0;
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(ProfileImageSize / 2)
        ),
        // import 'package:cached_network_image/cached_network_image.dart'; at the top to use CachedNetworkImage
        child: CachedNetworkImage(
          imageUrl: "https://secure.gravatar.com/avatar/ef4a9338dca42372f15427cdb4595ef7",
          placeholder: (context, url) => new CircularProgressIndicator(),
          errorWidget: (context, url, error) => new Icon(Icons.error),
      ))
      );
 }

  LinearGradient get musicGradient => LinearGradient(
        colors: [
          Colors.grey[800],
          Colors.grey[900],
          Colors.grey[900],
          Colors.grey[800]
        ],
        stops: [0.0,0.4, 0.6,1.0],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight
      );

  Widget _getMusicPlayerAction() {
   return Container(
        margin: EdgeInsets.only(top: 10.0),
        width: ActionWidgetSize, 
        height: ActionWidgetSize,
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(11.0),
            height: ProfileImageSize, 
            width: ProfileImageSize,
            decoration: BoxDecoration(
              gradient: musicGradient,
              borderRadius: BorderRadius.circular(ProfileImageSize / 2)
            ),
            child: CachedNetworkImage(
              imageUrl: "https://secure.gravatar.com/avatar/ef4a9338dca42372f15427cdb4595ef7",
              placeholder: (context, url) => new CircularProgressIndicator(),
              errorWidget: (context, url, error) => new Icon(Icons.error),
          ),
          ),
          
          ]));
  }
}
