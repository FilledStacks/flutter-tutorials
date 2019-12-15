import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:the_basics/datamodels/episode_item_model.dart';

class Api {
  static const String _apiEndpoint =
      'https://us-central1-thebasics-2f123.cloudfunctions.net/thebasics';

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

  Future<dynamic> getEpisode(int id) async {
    var response = await http.get('$_apiEndpoint/episode?id=$id');

    print(
        'getEpisode | response: ${response.body} statusCode: ${response.statusCode}');

    if (response.statusCode == 200) {
      var episode = EpisodeItemModel.fromJson(json.decode(response.body));
      return episode;
    }

    // something wrong happened
    return 'Could not fetch episode $id. Make sure it exists';
  }
}
