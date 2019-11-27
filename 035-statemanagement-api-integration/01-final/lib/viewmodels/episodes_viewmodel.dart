import 'package:flutter/cupertino.dart';
import 'package:the_basics/datamodels/episode_item_model.dart';
import 'package:the_basics/locator.dart';
import 'package:the_basics/services/api.dart';

class EpisodesViewModel extends ChangeNotifier {
  final _api = locator<Api>();

  List<EpisodeItemModel> _episodes;
  List<EpisodeItemModel> get episodes => _episodes;

  bool _busy;
  bool get busy => _busy;

  String _errorMessage;
  String get errorMessage => _errorMessage;

  Future getEpisodes() async {
    _setBusy(true);
    var episodesResuls = await _api.getEpisodes();

    if (episodesResuls is String) {
      _errorMessage = episodesResuls;
    } else {
      _episodes = episodesResuls;
    }

    _setBusy(false);
  }

  void _setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
