import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/core/services/authentication_service.dart';
import 'package:provider_architecture/locator.dart';
import 'package:provider_architecture/ui/router.dart';

import 'core/models/user.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  StreamProvider<User>(
          initialData: User.initial(),
          builder: (context) => locator<AuthenticationService>().userController,
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(),
            initialRoute: 'login',
            onGenerateRoute: Router.generateRoute,
          ),
    );
  }
}
