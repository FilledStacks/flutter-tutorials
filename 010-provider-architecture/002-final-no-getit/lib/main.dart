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
          dispose: (_, api) => api.dispose(),
        ),
        ProxyProvider<Api, AuthenticationService>(
          builder: (_, api, previous) =>
              (previous ?? AuthenticationService())..api = api,
          dispose: (_, auth) => auth.dispose(),
        ),
        // TODO(rousselGit) change to StreamProxyProvider<AuthentificationService, User> when available
        ProxyProvider<AuthenticationService, Stream<User>>.custom(
          builder: (_, auth, __) => auth.user,
          providerBuilder: (_, stream, child) {
            return StreamProvider<User>.value(
              stream: stream,
              initialData: User.initial(),
              child: child,
            );
          },
        ),
        // TODO(rousselGit) change to ChangeNotifierProxyProvider2<User, Api, HomeModel> when available
        ProxyProvider<User, HomeModel>.custom(
          builder: (context, user, previous) => (previous ?? HomeModel())
            ..api = Provider.of<Api>(context)
            ..userId = user?.id,
          dispose: (_, model) => model.dispose(),
          providerBuilder: (_, notifier, child) {
            return ChangeNotifierProvider<HomeModel>.value(
              notifier: notifier,
              child: child,
            );
          },
        ),
        ProxyProvider<AuthenticationService, LoginModel>.custom(
          builder: (_, auth, previous) =>
              (previous ?? LoginModel())..authenticationService = auth,
          providerBuilder: (_, login, child) =>
              ChangeNotifierProvider<LoginModel>.value(
                notifier: login,
                child: child,
              ),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: {
          // `initialRoute` is not enough
          // the route `/` will always be pushed. So `/` should handle displaying LoginView internally
          // see https://stackoverflow.com/questions/56145378/why-is-initstate-called-twice/56145478#56145478
          '/': (context) => Provider.of<User>(context)?.id != null
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
