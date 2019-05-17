import 'package:flutter/foundation.dart';

/// Represents the state of the view
enum ViewState { Idle, Busy }

class BaseModel extends ChangeNotifier {
  ViewState _viewstate = ViewState.Idle;
  String _errorMessage = '';

  ViewState get viewState => _viewstate;
  String get errorMessage => _errorMessage;
  bool get hasError => _errorMessage != '';

  void setState(ViewState state) {
    _viewstate = state;
    notifyListeners();
  }

  void setErrorMessage(String message) {
    _errorMessage = message;
    notifyListeners();
  }
}
