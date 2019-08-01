import 'package:dialog_manager/locator.dart';
import 'package:dialog_manager/ui/home/home_view.dart';
import 'package:flutter/material.dart';

import 'managers/dialog_manager.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => Navigator(
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) => DialogManager(
            child: widget,
          ),
        ),
      ),
      title: 'Dialog Manager Setup',
      home: HomeView(),
    );
  }
}