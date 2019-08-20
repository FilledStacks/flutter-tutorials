import 'package:abstraction_unit/services/api/api.dart';
import 'package:abstraction_unit/services/post_service.dart';
import 'package:abstraction_unit/services/storage/storage_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockStorageService extends Mock implements StorageService {}

class MockApi extends Mock implements Api {}

void main() {
  group('PostService Test | ', () {
    test('Constructing Service should find correct dependencies', () {
      var postService = PostService();
      expect(postService != null, true);
    });

    test('Given postId 1, should call localStorageService with 1', () async {
      var storageService = MockStorageService();

      var mockApi = MockApi();
      when(mockApi.likePost(1)).thenAnswer((_) => Future.value(true));

      var postService =
          PostService(api: mockApi, storageService: storageService);
      await postService.likePost(1);
      verify(storageService.likePost(1));
    });
  });
}
