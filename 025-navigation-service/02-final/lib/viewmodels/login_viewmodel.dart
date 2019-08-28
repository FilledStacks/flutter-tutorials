import 'package:nav_service/constants/route_paths.dart' as routes;
import 'package:nav_service/locator.dart';
import 'package:nav_service/services/navigation_service.dart';
import 'package:nav_service/viewmodels/basemodel.dart';

class LoginViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  Future login({bool success = true}) async {
    setBusy(true);
    await Future.delayed(Duration(seconds: 1));

    if (!success) {
      setErrorMessage('Error has occured with the login');
    } else {
      _navigationService.navigateTo(routes.HomeRoute, arguments: '\nFilledStacks');
      setErrorMessage(null);
    }

    setBusy(false);
  }
}
