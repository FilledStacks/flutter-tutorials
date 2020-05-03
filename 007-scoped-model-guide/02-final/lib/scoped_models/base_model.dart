import 'package:scoped_guide/enums/view_state.dart';
import 'package:scoped_model/scoped_model.dart';
export 'package:scoped_model/scoped_model.dart';

// Make sure state enum is accessible in all inherting models
export 'package:scoped_guide/enums/view_state.dart';

class BaseModel extends Model {
  ViewState _state;
  ViewState get state => _state;

  void setState(ViewState newState) {
    _state = newState;

    // Notify listeners will only update listeners of state.
    notifyListeners();
  }
}
