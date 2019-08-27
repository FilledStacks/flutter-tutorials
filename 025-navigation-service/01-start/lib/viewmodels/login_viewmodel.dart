import 'package:nav_service/viewmodels/basemodel.dart';

class LoginViewModel extends BaseModel {
  Future<bool> login({bool success = true}) async {
    setBusy(true);
    await Future.delayed(Duration(seconds: 1));

    if (!success) {
      setErrorMessage('Error has occured with the login');
    } else {
      setErrorMessage(null);
    }

    setBusy(false);
    return success;
  }
}
