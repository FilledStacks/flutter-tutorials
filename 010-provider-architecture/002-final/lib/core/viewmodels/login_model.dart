import 'package:provider_architecutre/core/enums/viewstate.dart';
import 'package:provider_architecutre/core/services/authentication_service.dart';

import '../../locator.dart';
import 'base_model.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);

    var userId = int.tryParse(userIdText);
    var success = await _authenticationService.login(userId);

    setState(ViewState.Idle);
    return success;
  }
}
