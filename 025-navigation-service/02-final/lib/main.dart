import 'package:flutter/material.dart';
import 'package:nav_service/constants/route_paths.dart' as routes;
import 'package:nav_service/locator.dart';
import 'package:nav_service/router.dart' as router;
import 'package:nav_service/services/navigation_service.dart';

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
      theme: ThemeData(
        backgroundColor: Colors.grey[800]
      ),
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: router.generateRoute,
      initialRoute: routes.LoginRoute,
    );
  }
}
