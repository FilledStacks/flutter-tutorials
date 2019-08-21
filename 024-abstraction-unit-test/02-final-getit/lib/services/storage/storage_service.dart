abstract class StorageService {
  Stream<int> get postUpdateStream;

  Future<bool> likePost(int postId, {bool unlike = false});

  void dispose();
}