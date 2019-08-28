import 'package:nav_service/locator.dart';
import 'package:nav_service/viewmodels/basemodel.dart';
import 'package:nav_service/services/navigation_service.dart';

class HomeViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  Future logout({bool success = true}) async {
    setBusy(true);
    await Future.delayed(Duration(seconds: 1));

    if (!success) {
      setErrorMessage('Error has occured during sign out');
    } else {
      _navigationService.goBack();
    }
  }
}
