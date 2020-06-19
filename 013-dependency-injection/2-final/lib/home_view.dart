import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_info.dart';

class HomeView extends StatelessWidget {
  HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MyList());
  }
}

class MyList extends StatelessWidget {
  const MyList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PostItem();
  }
}

class PostItem extends StatelessWidget {
  const PostItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PostMenu();
  }
}

class PostMenu extends StatelessWidget {
  const PostMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PostAction();
  }
}

class PostAction extends StatelessWidget {
  const PostAction({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LikeButton();
  }
}

class LikeButton extends StatelessWidget {
  const LikeButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // We have access to it anywhere in the app with this simple call
    var appInfo = Provider.of<AppInfo>(context);
    return Container(
      child: Text(appInfo.welcomeMessage),
    );
  }
}
