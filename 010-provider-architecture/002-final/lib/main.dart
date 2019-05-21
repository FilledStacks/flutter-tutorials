import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecutre/core/services/authentication_service.dart';
import 'package:provider_architecutre/core/viewmodels/login_model.dart';
import 'package:provider_architecutre/ui/router.dart';
import 'package:provider_architecutre/ui/views/home_view.dart';
import 'package:provider_architecutre/ui/views/login_view.dart';

import 'core/models/user.dart';
import 'core/services/api.dart';
import 'core/viewmodels/home_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          builder: (_) => Api(),
        ),
        ProxyProvider<Api, AuthenticationService>(
          builder: (_, api, previous) =>
              (previous ?? AuthenticationService())..api = api,
        ),
        StreamProxyProvider<AuthenticationService, Stream<User>>(
          builder: (_, auth, __) => auth.user,
        ),
        ChangeNotifierProxyProvider2<User, Api, HomeModel>(
          builder: (context, user, api, previous) => (previous ?? HomeModel())
            ..api = api
            ..userId = user?.id,
        ),
        ProxyChangeNotifierProvider<AuthenticationService, LoginModel>(
          builder: (_, auth, previous) =>
              (previous ?? LoginModel())..authenticationService = auth),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: {
          '/': (context) => Provider.of<User>(context) != null
              ? const HomeView()
              : const LoginView(),
          '/login': (_) => const LoginView(),
        },
        onGenerateRoute: Router.generateRoute,
        onUnknownRoute: (settings) => MaterialPageRoute(
              builder: (_) => Scaffold(
                    body: Center(
                      child: Text('No route defined for ${settings.name}'),
                    ),
                  ),
            ),
      ),
    );
  }
}
