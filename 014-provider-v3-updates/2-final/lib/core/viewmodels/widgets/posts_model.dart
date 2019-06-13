import 'package:meta/meta.dart';
import 'package:provider_arc/core/viewmodels/base_model.dart';
import 'package:provider_arc/core/models/post.dart';
import 'package:provider_arc/core/services/api.dart';

class PostsModel extends BaseViewModel {
  Api _api;

  PostsModel({
    @required Api api,
  }) : _api = api;

  List<Post> posts;

  Future getPosts(int userId) async {
    setBusy(true);
    posts = await _api.getPostsForUser(userId);
    setBusy(true);
  }
}
