import 'package:provider_architecutre/core/enums/viewstate.dart';
import 'package:provider_architecutre/core/models/comment.dart';
import 'package:provider_architecutre/core/services/api.dart';
import 'base_model.dart';

class CommentsModel extends BaseModel {
  Api _api;
  Api get api => _api;
  set api(Api api) {
    _api = api;
    notifyListeners();
  }

  int _postId;
  int get postId => _postId;
  set postId(int postId) {
    if (postId != _postId) {
      _postId = postId;
      _fetchComments(postId);
      notifyListeners();
    }
  }

  List<Comment> _comments;
  List<Comment> get comments => _comments;

  Future _fetchComments(int postId) async {
    if (state == ViewState.Busy) {
      throw StateError('already fetching');
    }
    setState(ViewState.Busy);
    _comments = await _api.getCommentsForPost(postId);
    setState(ViewState.Idle);
  }
}
