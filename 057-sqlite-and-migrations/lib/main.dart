import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:sqflite_migration_example/app/locator.dart';
import 'package:sqflite_migration_example/ui/router.dart' as router;
import 'package:sqflite_migration_example/ui/startup/startup_view.dart';
import 'package:stacked_services/stacked_services.dart';

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
      navigatorKey: locator<NavigationService>().navigatorKey,
      home: StartupView(),
      onGenerateRoute: router.Router.onGenerateRoute,
    );
  }
}
