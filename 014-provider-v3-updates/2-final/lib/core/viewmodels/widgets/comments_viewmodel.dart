import 'package:meta/meta.dart';
import 'package:provider_arc/core/viewmodels/base_viewmodel.dart';
import 'package:provider_arc/core/models/comment.dart';
import 'package:provider_arc/core/services/api.dart';

class CommentsViewModel extends BaseViewModel {
  Api _api;
  CommentsViewModel({@required Api api}) : _api = api;
  
  List<Comment> comments;

  Future fetchComments(int postId) async {
    setBusy();
    comments = await _api.getCommentsForPost(postId);
    setIdle();
  }
}
