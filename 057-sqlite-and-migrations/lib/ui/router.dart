import 'package:flutter/material.dart';
import 'package:sqflite_migration_example/ui/todo/todo_view.dart';

/// Function created using the router setup found in the below FilledStacks article.
/// https://www.filledstacks.com/post/flutter-navigation-cheatsheet-a-guide-to-named-routing/#setup-a-router-for-named-routing

class Router {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case todo:
      default:
        return MaterialPageRoute(builder: (context) => TodoView());
    }
  }

  static const todo = 'todo';
}
