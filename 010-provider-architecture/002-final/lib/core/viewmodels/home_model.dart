import 'package:provider_architecutre/core/enums/viewstate.dart';
import 'package:provider_architecutre/core/models/post.dart';
import 'package:provider_architecutre/core/services/api.dart';

import 'base_model.dart';

class HomeModel extends BaseModel {
  Api api;

  int _userId;
  int get userId => _userId;
  set userId(int userId) {
    if (_userId != userId) {
      _userId = userId;
      _getPosts(userId);
      notifyListeners();
    }
  }

  List<Post> posts = [];

  Future _getPosts(int userId) async {
    setState(ViewState.Busy);
    posts = await api.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}
