import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'episodes_view_desktop.dart';

class EpisodesView extends StatelessWidget {
  const EpisodesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: EpisodesViewDesktop(),
    );
  }
}
