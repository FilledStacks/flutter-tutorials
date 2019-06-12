import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_arc/provider_setup.dart';
import 'package:provider_arc/ui/router.dart';
import 'package:provider_arc/ui/views/login_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: getProviders(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: 'login',
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
