import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecutre/core/models/post.dart';
import 'package:provider_architecutre/ui/views/post_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/post':
        var post = settings.arguments as Post;
        return MaterialPageRoute(
          builder: (_) => Provider.value(value: post, child: PostView()),
        );
      default:
        return null;
    }
  }
}
