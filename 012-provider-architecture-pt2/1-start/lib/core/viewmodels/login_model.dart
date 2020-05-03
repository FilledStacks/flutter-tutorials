import 'package:provider_architecutre/core/enums/viewstate.dart';
import 'package:provider_architecutre/core/services/authentication_service.dart';
import 'package:provider_architecutre/core/viewmodels/base_model.dart';

import '../../locator.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  String errorMessage;

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);

    var userId = int.tryParse(userIdText);

    // Not a number
    if(userId == null) {
      errorMessage = 'Value entered is not a number';
      setState(ViewState.Idle);
      return false;
    }

    var success = await _authenticationService.login(userId);

    // Handle potential error here too. 

    setState(ViewState.Idle);
    return success;
  }
}
