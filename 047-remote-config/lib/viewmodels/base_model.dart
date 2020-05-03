import 'package:compound/locator.dart';
import 'package:compound/models/user.dart';
import 'package:compound/services/authentication_service.dart';
import 'package:compound/services/remote_config_service.dart';
import 'package:flutter/widgets.dart';

class BaseModel extends ChangeNotifier {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final RemoteConfigService _remoteConfigService =
      locator<RemoteConfigService>();

  User get currentUser => _authenticationService.currentUser;

  // Since it'll most likely be used in almost every view we expose it here
  bool get showMainBanner => _remoteConfigService.showMainBanner;

  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
