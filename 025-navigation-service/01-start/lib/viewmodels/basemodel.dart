import 'package:flutter/cupertino.dart';

class BaseModel extends ChangeNotifier {
  bool _busy = false;
  String _errorMessage;

  bool get busy => _busy;
  String get errorMessage => _errorMessage;
  bool get hasErrorMessage => _errorMessage != null && _errorMessage.isNotEmpty;

  void setErrorMessage(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
