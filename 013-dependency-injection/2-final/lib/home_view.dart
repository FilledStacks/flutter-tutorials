import 'package:dependency_injection/app_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appInfo = Provider.of<AppInfo>(context);
    return Scaffold(
      body: Center(
        child: Text(appInfo.welcomeMessage),
      ),
    );
  }
}
