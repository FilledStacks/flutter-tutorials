import 'package:abstraction_example/datamodels/api_models.dart';

import 'api.dart';

class HttpApi implements Api {
  @override
  Future<List<Comment>> getCommentsForPost(int postId) {
    // TODO: implement getCommentsForPost
    return null;
  }

  @override
  Future<List<Post>> getPostsForUser(int userId) {
    // TODO: implement getPostsForUser
    return null;
  }

  @override
  Future<User> getUser(int userId) {
    // TODO: implement getUser
    return null;
  }

  @override
  Future<LoginResponse> login({String username, String password}) {
    // TODO: implement login
    return null;
  }
}
