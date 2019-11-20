import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:the_basics/widgets/episodes_list/episodes_list.dart';
import 'package:the_basics/widgets/season_details/season_details.dart';

class EpisodesViewDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          SeasonDetails(),
          SizedBox(
            height: 50,
          ),
          EpisodesList(),
        ],
      ),
    );
  }
}
