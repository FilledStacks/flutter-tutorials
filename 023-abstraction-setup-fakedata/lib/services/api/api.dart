import 'package:abstraction_example/datamodels/api_models.dart';

abstract class Api {
  Future<LoginResponse> login({String username, String password});

  Future<User> getUser(int userId);

  Future<List<Post>> getPostsForUser(int userId);
  
  Future<List<Comment>> getCommentsForPost(int postId);  
}