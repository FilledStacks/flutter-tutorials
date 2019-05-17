import 'dart:async';

import 'package:provider_architecutre/core/models/user.dart';
import 'package:provider_architecutre/core/services/api.dart';
import 'package:provider_architecutre/locator.dart';

class AuthenticationService {
  // Inject our Api
  Api _api = locator<Api>();

   StreamController<User> userController = StreamController<User>();

  Future<bool> login(int userId) async {
    // Get the user profile for id
    var fetcheduser = await _api.getUserProfile(userId);

    // Check if success
    var hasUser = fetcheduser != null;

    if (hasUser) {
      // emit user when we have one
      userController.add(fetcheduser);
    }
    
    return hasUser;
  }
}