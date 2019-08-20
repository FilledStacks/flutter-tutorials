import 'package:http/http.dart' as http;

class Api {
  static const endpoint = 'https://myapi.com';

  var client = new http.Client();

  Future<bool> likePost(int postId) async {
    var response =
        await client.post('$endpoint/likePost/$postId');

    if(response.statusCode == 200) {
      return true;
    }

    return false;
  }
}
