import 'package:abstraction_unit/locator.dart';
import 'package:abstraction_unit/services/api/api.dart';
import 'package:abstraction_unit/services/post_service.dart';
import 'package:abstraction_unit/services/storage/localstorage_service.dart';
import 'package:abstraction_unit/services/storage/storage_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockStorageService extends Mock implements StorageService {}

class MockApi extends Mock implements Api {}

void main() {
  group('PostService Test | ', () {
    setUpAll(() {
      setupLocator();
      locator.allowReassignment = true;
    });

    test('Constructing Service should find correct dependencies', () {
      var postService = PostService();
      expect(postService != null, true);
    });

    test('Given postId 1, should call localStorageService with 1', () async {
      var mockStorageService = MockStorageService();
      locator.registerSingleton<StorageService>(mockStorageService);

      var mockApi = MockApi();
      when(mockApi.likePost(1)).thenAnswer((_) => Future.value(true));
      locator.registerSingleton<Api>(mockApi);

      var postService = PostService();
      await postService.likePost(1);
      verify(mockStorageService.likePost(1));
    });
  });
}
