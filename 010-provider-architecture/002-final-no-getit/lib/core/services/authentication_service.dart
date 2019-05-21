import 'dart:async';

import 'package:provider_architecutre/core/models/user.dart';
import 'api.dart';

class AuthenticationService {
  Api api;

  StreamController<User> _userController = StreamController<User>();
  Stream<User> get user => _userController.stream;

  Future<bool> login(int userId) async {
    var fetchedUser = await api.getUserProfile(userId);
    var hasUser = fetchedUser != null;
    if (hasUser) {
      _userController.add(fetchedUser);
    }
    return hasUser;
  }

  dispose() {
    _userController.close();
  }
}
