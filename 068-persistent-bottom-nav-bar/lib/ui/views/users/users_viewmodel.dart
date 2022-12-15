import 'package:persistent_bottom_nav_bar/app/app.locator.dart';
import 'package:persistent_bottom_nav_bar/app/router_ids.dart';
import 'package:persistent_bottom_nav_bar/models/user_model.dart';
import 'package:persistent_bottom_nav_bar/ui/views/user_details/user_details_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UsersViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  List<User> get users => usersData;

  void onUserTap(User user) {
    _navigationService.navigateWithTransition(
      UserDetailsView(user: user),
      id: userRouterId,
      transition: 'rightToLeftWithFade',
    );
  }
}
