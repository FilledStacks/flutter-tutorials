import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/app/app.locator.dart';
import 'package:persistent_bottom_nav_bar/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persistent Bottom Nav Bar',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: Routes.mainView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
    );
  }
}
