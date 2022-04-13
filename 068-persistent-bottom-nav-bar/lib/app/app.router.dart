// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../models/post_model.dart';
import '../models/user_model.dart';
import '../ui/views/main/main_view.dart';
import '../ui/views/post_details/post_details_view.dart';
import '../ui/views/posts/posts_view.dart';
import '../ui/views/user_details/user_details_view.dart';
import '../ui/views/users/users_view.dart';

class Routes {
  static const String mainView = '/';
  static const all = <String>{
    mainView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(
      Routes.mainView,
      page: MainView,
      generator: MainViewRouter(),
    ),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    MainView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const MainView(),
        settings: data,
      );
    },
  };
}

class MainViewRoutes {
  static const String postsView = '/posts-view';
  static const String usersView = '/users-view';
  static const all = <String>{
    postsView,
    usersView,
  };
}

class MainViewRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(
      MainViewRoutes.postsView,
      page: PostsView,
      generator: PostsViewRouter(),
    ),
    RouteDef(
      MainViewRoutes.usersView,
      page: UsersView,
      generator: UsersViewRouter(),
    ),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    PostsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const PostsView(),
        settings: data,
      );
    },
    UsersView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const UsersView(),
        settings: data,
      );
    },
  };
}

class PostsViewRoutes {
  static const String postDetailsView = '/post-details-view';
  static const all = <String>{
    postDetailsView,
  };
}

class PostsViewRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(PostsViewRoutes.postDetailsView, page: PostDetailsView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    PostDetailsView: (data) {
      var args = data.getArgs<PostDetailsViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => PostDetailsView(
          key: args.key,
          post: args.post,
        ),
        settings: data,
      );
    },
  };
}

class UsersViewRoutes {
  static const String userDetailsView = '/user-details-view';
  static const all = <String>{
    userDetailsView,
  };
}

class UsersViewRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(UsersViewRoutes.userDetailsView, page: UserDetailsView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    UserDetailsView: (data) {
      var args = data.getArgs<UserDetailsViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => UserDetailsView(
          key: args.key,
          user: args.user,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// PostDetailsView arguments holder class
class PostDetailsViewArguments {
  final Key? key;
  final Post post;
  PostDetailsViewArguments({this.key, required this.post});
}

/// UserDetailsView arguments holder class
class UserDetailsViewArguments {
  final Key? key;
  final User user;
  UserDetailsViewArguments({this.key, required this.user});
}
