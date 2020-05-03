import 'package:compound/constants/route_names.dart';
import 'package:compound/locator.dart';
import 'package:compound/services/authentication_service.dart';
import 'package:compound/services/dynamic_link_service.dart';
import 'package:compound/services/navigation_service.dart';
import 'package:compound/services/push_notification_service.dart';
import 'package:compound/viewmodels/base_model.dart';

class StartUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final PushNotificationService _pushNotificationService =
      locator<PushNotificationService>();
  final DynamicLinkService _dynamicLinkService = locator<DynamicLinkService>();

  Future handleStartUpLogic() async {
    await _dynamicLinkService.handleDynamicLinks();
    
    // Register for push notifications
    await _pushNotificationService.initialise();

    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();

    if (hasLoggedInUser) {
      _navigationService.navigateTo(HomeViewRoute);
    } else {
      _navigationService.navigateTo(LoginViewRoute);
    }
  }
}
