import 'package:flutter/material.dart';
import 'package:provider_arc/ui/router.dart';

import 'core/constants/app_contstants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutePaths.Login,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
