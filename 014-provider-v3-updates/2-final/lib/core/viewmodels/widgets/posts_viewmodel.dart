import 'package:meta/meta.dart';
import 'package:provider_arc/core/viewmodels/base_viewmodel.dart';
import 'package:provider_arc/core/models/post.dart';
import 'package:provider_arc/core/services/api.dart';

class PostsViewModel extends BaseViewModel {
  Api _api;

  PostsViewModel({
    @required Api api,
  }) : _api = api;

  List<Post> posts;

  Future getPosts(int userId) async {
    setBusy();
    posts = await _api.getPostsForUser(userId);
    setIdle();
  }
}
