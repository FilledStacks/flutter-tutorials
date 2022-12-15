import 'package:persistent_bottom_nav_bar/ui/views/main/main_view.dart';
import 'package:persistent_bottom_nav_bar/ui/views/post_details/post_details_view.dart';
import 'package:persistent_bottom_nav_bar/ui/views/posts/posts_view.dart';
import 'package:persistent_bottom_nav_bar/ui/views/user_details/user_details_view.dart';
import 'package:persistent_bottom_nav_bar/ui/views/users/users_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(
      page: MainView,
      initial: true,
      children: [
        MaterialRoute(
          page: PostsView,
          children: [
            MaterialRoute(page: PostDetailsView),
          ],
        ),
        MaterialRoute(
          page: UsersView,
          children: [
            MaterialRoute(page: UserDetailsView),
          ],
        ),
      ],
    ),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
)
class App {}
