import 'package:flutter/material.dart';
import 'package:skeleton_watcher/ui/views/home_view.dart';
import './service_locator.dart';

void main() {
  // Register all the models and services before the app starts
  setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Skeleton Watcher',
        theme: ThemeData(
            primaryColor: Color.fromARGB(255, 9, 202, 172),
            backgroundColor: Color.fromARGB(255, 26, 27, 30),
            textTheme: Theme.of(context).textTheme.apply(
                fontFamily: 'Open Sans',
                bodyColor: Colors.white,
                displayColor: Colors.white)),
        home: HomeView());
  }
}
