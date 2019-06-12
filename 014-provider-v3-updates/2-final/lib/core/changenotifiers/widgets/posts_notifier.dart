import 'package:meta/meta.dart';
import 'package:provider_arc/core/changenotifiers/base_notifier.dart';
import 'package:provider_arc/core/models/post.dart';
import 'package:provider_arc/core/services/api.dart';

class PostsNotifier extends BaseNotifier {
  Api _api;

  PostsNotifier({
    @required Api api,
  }) : _api = api;

  List<Post> posts;

  Future getPosts(int userId) async {
    setBusy();
    posts = await _api.getPostsForUser(userId);
    setIdle();
  }
}
