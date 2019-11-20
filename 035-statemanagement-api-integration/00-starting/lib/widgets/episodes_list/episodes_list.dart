import 'package:flutter/material.dart';
import 'package:the_basics/datamodels/episode_item.model.dart';

import 'episode_item.dart';

class EpisodesList extends StatelessWidget {
  final episodes = [
    EpisodeItemModel(
        title: 'Setup, Build and Deploy', duration: 12, imageUrl: ''),
    EpisodeItemModel(
        title: 'Adding a Responsive UI', duration: 12, imageUrl: ''),
    EpisodeItemModel(title: 'Layout Templates', duration: 12, imageUrl: ''),
    EpisodeItemModel(
        title: 'State Management and Layout Templates',
        duration: 12,
        imageUrl: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.start,
        children: <Widget>[
          ...episodes.map(
            (episode) => EpisodeItem(
              title: episode.title,
              imageUrl: episode.imageUrl,
              duration: episode.duration,
            ),
          )
        ],
      ),
    ]);
  }
}
