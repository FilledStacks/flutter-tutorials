import 'package:abstraction_unit/services/api/api.dart';
import 'package:http/http.dart' as http;

class HttpApi implements Api {
  static const endpoint = 'https://myapi.com';

  var client = new http.Client();

  @override
  Future<bool> likePost(int postId) async {
    var response =
        await client.post('$endpoint/likePost/$postId');

    if(response.statusCode == 200) {
      return true;
    }

    return false;
  }
}
