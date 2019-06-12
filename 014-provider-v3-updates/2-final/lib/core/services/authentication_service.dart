import 'dart:async';

import 'package:provider_arc/core/models/user.dart';
import 'package:provider_arc/core/services/api.dart';

class AuthenticationService {
  final Api _api;

  AuthenticationService({Api api}) : _api = api;

  User _user = User.initial();

  User get user => _user;

  Future<bool> login(int userId) async {
    var fetchedUser = await _api.getUserProfile(userId);

    var hasUser = fetchedUser != null;
    if (hasUser) {
      _user = fetchedUser;
    }

    return hasUser;
  }
}
