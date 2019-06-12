import 'package:flutter/cupertino.dart';
import 'package:provider_arc/core/models/user.dart';
import 'package:provider_arc/core/services/authentication_service.dart';

class HomeViewNotifier extends ChangeNotifier {
  AuthenticationService _authenticationService;

  HomeViewNotifier({@required AuthenticationService authenticationService})
      : _authenticationService = authenticationService;
}
