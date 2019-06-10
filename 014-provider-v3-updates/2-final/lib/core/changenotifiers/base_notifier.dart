import 'package:flutter/cupertino.dart';

class BaseNotifier extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;

  void setBusy() {
    _busy = true;
    notifyListeners();
  }

  void setIdle() {
    _busy = false;
    notifyListeners();
  }
}
