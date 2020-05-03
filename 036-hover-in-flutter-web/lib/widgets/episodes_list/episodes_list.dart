import 'package:flutter/material.dart';
import 'package:the_basics/datamodels/episode_item_model.dart';

import 'episode_item.dart';

class EpisodesList extends StatelessWidget {
  final List<EpisodeItemModel> episodes;
  EpisodesList({this.episodes});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 30,
      runSpacing: 30,
      children: <Widget>[
        ...episodes.map(
          (episode) => EpisodeItem(model: episode),
        )
      ],
    );
  }
}
