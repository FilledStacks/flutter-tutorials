import 'package:persistent_bottom_nav_bar/app/app.locator.dart';
import 'package:persistent_bottom_nav_bar/app/router_ids.dart';
import 'package:persistent_bottom_nav_bar/models/post_model.dart';
import 'package:persistent_bottom_nav_bar/ui/views/post_details/post_details_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PostsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  List<Post> get posts => postsData;

  void onPostTap(Post post) {
    _navigationService.navigateWithTransition(
      PostDetailsView(post: post),
      id: postRouterId,
      transition: 'rightToLeftWithFade',
    );
  }
}
