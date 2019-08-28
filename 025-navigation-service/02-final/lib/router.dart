import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nav_service/constants/route_paths.dart' as routes;
import 'package:nav_service/views/home_view.dart';
import 'package:nav_service/views/login_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.LoginRoute:
      return MaterialPageRoute(builder: (context) => LoginView());
    case routes.HomeRoute:
      var userName = settings.arguments as String;
      return MaterialPageRoute(
          builder: (context) => HomeView(userName: userName));
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('No path for ${settings.name}'),
          ),
        ),
      );
  }
}
