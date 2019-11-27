import 'package:flutter/material.dart';
import 'package:the_basics/datamodels/episode_item_model.dart';
import 'package:the_basics/locator.dart';
import 'package:the_basics/services/api.dart';

class EpisodesViewModel extends ChangeNotifier {
  final _api = locator<Api>();

  List<EpisodeItemModel> _episodes;
  List<EpisodeItemModel> get episodes => _episodes;

  Future getEpisodes() async {
    var episodeResults = await _api.getEpisodes();

    if (episodeResults is String) {
      // show error
    } else {
      _episodes = episodeResults;
    }

    notifyListeners();
  }
}
