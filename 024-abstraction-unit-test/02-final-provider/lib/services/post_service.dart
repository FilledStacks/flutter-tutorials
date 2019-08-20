import 'package:abstraction_unit/services/api/api.dart';
import 'package:abstraction_unit/services/storage/storage_service.dart';

class PostService {
  final Api _api;
  final StorageService _storageService;

  PostService({
    Api api,
    StorageService storageService,
  })  : _api = api,
        _storageService = storageService;

  Future<bool> likePost(int postId) async {
    var localLikeSuccess = await _storageService.likePost(postId);
    var postLiked = await _api.likePost(postId);

    if (postLiked) {
      return true;
    }

    // TODO: Revert the local like
    if (localLikeSuccess) {
      await _storageService.likePost(postId, unlike: true);
    }

    return false;
  }
}
