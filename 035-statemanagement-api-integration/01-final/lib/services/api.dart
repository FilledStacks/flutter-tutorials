import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:the_basics/datamodels/episode_item_model.dart';

class Api {
  static const String _apiEndpoint =
      'http://localhost:5000/thebasics-2f123/us-central1/thebasics/';

  String _token;

  Future<dynamic> getEpisodes() async {
    var response = await http.get('$_apiEndpoint/courseEpisodes');

    if (response.statusCode == 200) {
      var episodes = (json.decode(response.body) as List)
          .map((episode) => EpisodeItemModel.fromJson(episode))
          .toList();
      return episodes;
    }

    // something wrong happened
    return 'Could not fetch the episodes at this time';
  }
}
