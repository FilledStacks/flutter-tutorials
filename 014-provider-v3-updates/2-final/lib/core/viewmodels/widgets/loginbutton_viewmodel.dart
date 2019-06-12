import 'package:provider_arc/core/viewmodels/base_viewmodel.dart';
import 'package:provider_arc/core/services/authentication_service.dart';

class LoginButtonNotifier extends BaseNotifier {
  AuthenticationService _authenticationService;

  LoginButtonNotifier({AuthenticationService authenticationService})
      : _authenticationService = authenticationService;

  Future<bool> performLogin(String userIdText) async {
    setBusy();
    var userId = int.tryParse(userIdText);
    var success = await _authenticationService.login(userId);
    setIdle();
    return success;
  }
}
