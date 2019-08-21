import 'package:abstraction_unit/locator.dart';
import 'package:abstraction_unit/services/api/api.dart';
import 'package:abstraction_unit/services/storage/storage_service.dart';

class PostService {
  Api _api = locator<Api>();
  StorageService _localStorageService = locator<StorageService>();

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
