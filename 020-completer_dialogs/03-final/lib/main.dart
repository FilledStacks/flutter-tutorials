import 'package:dialog_manager/locator.dart';
import 'package:dialog_manager/managers/dialog_manager.dart';
import 'package:dialog_manager/ui/home/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: (context, widget) => Navigator(
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(
                  child: widget,
                )),
      ),
      home: HomeView(),
    );
  }
}
