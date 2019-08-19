import 'package:abstraction_unit/services/localstorage_service.dart';
import 'api.dart';

class PostService {
  Api _api;
  LocalStorageService _localStorageService;

  PostService({Api api, LocalStorageService localStorageService})
      : _api = api,
        _localStorageService = localStorageService;

  Future<bool> likePost(int postId) async {
    var localLikeSuccess = await _localStorageService.likePost(postId);
    var postLiked = await _api.likePost(postId);

    if (postLiked) {
      return true;
    }

    if (localLikeSuccess) {
      await _localStorageService.likePost(postId, unlike: true);
    }

    return false;
  }
}
