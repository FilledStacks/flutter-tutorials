import 'package:meta/meta.dart';
import 'package:provider_arc/core/changenotifiers/base_notifier.dart';
import 'package:provider_arc/core/models/comment.dart';
import 'package:provider_arc/core/services/api.dart';

class CommentsNotifier extends BaseNotifier {
  Api _api;
  CommentsNotifier({@required Api api}) : _api = api;
  
  List<Comment> comments;

  Future fetchComments(int postId) async {
    setBusy();
    comments = await _api.getCommentsForPost(postId);
    setIdle();
  }
}
