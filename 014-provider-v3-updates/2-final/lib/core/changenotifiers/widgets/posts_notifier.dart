import 'package:meta/meta.dart';
import 'package:provider_arc/core/changenotifiers/base_notifier.dart';
import 'package:provider_arc/core/models/post.dart';
import 'package:provider_arc/core/services/api.dart';
import 'package:provider_arc/core/services/authentication_service.dart';

class PostsNotifier extends BaseNotifier {
  Api _api;
  AuthenticationService _authenticationService;

  PostsNotifier(
      {@required Api api,
      @required AuthenticationService authenticationService})
      : _api = api,
        _authenticationService = authenticationService;

  List<Post> posts;

  Future getPosts() async {
    setBusy();
    posts = await _api.getPostsForUser(_authenticationService.user.id);
    setIdle();
  }
}
