import 'package:abstraction_unit/locator.dart';
import 'package:abstraction_unit/services/post_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PostService Test | ', () {
    setUpAll(() {
      setupLocator();
    });

    test('Constructing Service should find correct dependencies', () {
      var postService = PostService();
      expect(postService != null, true);
    });
  });
}
