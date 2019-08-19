import 'package:abstraction_unit/locator.dart';
import 'package:abstraction_unit/services/localstorage_service.dart';
import 'api.dart';

class PostService {
  Api _api = locator<Api>();
  LocalStorageService _localStorageService = locator<LocalStorageService>();

  Future<bool> likePost(int postId) async {
    var localLikeSuccess = await _localStorageService.likePost(postId);
    var postLiked = await _api.likePost(postId);

    if (postLiked) {
      return true;
    }

    // TODO: Revert the local like
    if (localLikeSuccess) {
      await _localStorageService.likePost(postId, unlike: true);
    }

    return false;
  }
}
