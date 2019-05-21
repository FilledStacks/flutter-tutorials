import 'package:provider_architecutre/core/enums/viewstate.dart';
import 'package:provider_architecutre/core/models/comment.dart';
import 'package:provider_architecutre/core/services/api.dart';
import 'base_model.dart';

class CommentsModel extends BaseModel {
  Api api;

  int _postId;
  int get postId => _postId;
  set postId(int postId) {
    if (postId != _postId) {
      _postId = postId;
      _fetchComments(postId);
      notifyListeners();
    }
  }

  List<Comment> comments;

  Future _fetchComments(int postId) async {
    setState(ViewState.Busy);
    comments = await api.getCommentsForPost(postId);
    setState(ViewState.Idle);
  }
}
