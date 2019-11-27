import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:the_basics/datamodels/episode_item_model.dart';

class Api {
  static const String _apiEndpoint =
      'https://us-central1-thebasics-2f123.cloudfunctions.net/thebasics';

  Future getEpisodes() async {
    var response = await http.get('$_apiEndpoint/courseEpisodes');
    print('getEpisodes | body:${response.body}');

    if (response.statusCode == 200) {
      var episodes = (json.decode(response.body) as List)
          .map((e) => EpisodeItemModel.fromJson(e))
          .toList();
      return episodes;
    }

    return 'Could not fetch episodes at this time';
  }
}
