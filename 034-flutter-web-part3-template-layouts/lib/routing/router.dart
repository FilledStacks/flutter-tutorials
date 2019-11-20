import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_basics/routing/route_names.dart';
import 'package:the_basics/views/about/about_view.dart';
import 'package:the_basics/views/episodes/episodes_view.dart';
import 'package:the_basics/views/home/home_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(HomeView(), settings.name);
    case AboutRoute:
      return _getPageRoute(AboutView(), settings.name);
    case EpisodesRoute:
      return _getPageRoute(EpisodesView(), settings.name);
    default:
  }
}

PageRoute _getPageRoute(Widget child, String routeName) {
  return _FadeRoute(child: child, routeName: routeName);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({this.child, this.routeName})
      : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                child,
            settings: RouteSettings(name: routeName),
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) =>
                FadeTransition(
                  opacity: animation,
                  child: child,
                ));
}

