import 'package:flutter/widgets.dart';
import 'package:provider_arc/core/changenotifiers/base_notifier.dart';
import 'package:provider_arc/core/services/authentication_service.dart';

class LoginNotifier extends BaseNotifier {
  AuthenticationService _authenticationService;

  LoginNotifier({AuthenticationService authenticationService})
      : _authenticationService = authenticationService;

  Future<bool> login(String userIdText) async {
    setBusy();
    var userId = int.tryParse(userIdText);
    var success = await _authenticationService.login(userId);
    setIdle();
    return success;
  }
}
