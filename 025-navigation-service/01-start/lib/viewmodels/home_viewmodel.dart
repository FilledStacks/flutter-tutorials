import 'package:nav_service/viewmodels/basemodel.dart';

class HomeViewModel extends BaseModel {
  Future<bool> logout({bool success = true}) async {
    setBusy(true);
    await Future.delayed(Duration(seconds: 1));

    if (!success) {
      setErrorMessage('Error has occured during sign out');
    } else {
      setErrorMessage(null);
    }

    setBusy(false);
    return success;
  }
}
