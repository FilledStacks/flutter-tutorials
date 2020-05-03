import 'package:flutter/material.dart';

import 'package:tik_tok_ui/widgets/video_description.dart';
import 'package:tik_tok_ui/widgets/actions_toolbar.dart';
import 'package:tik_tok_ui/widgets/bottom_toolbar.dart';

class Home extends StatelessWidget {
  Widget get topSection => Container(height: 100.0, color: Colors.yellow[300]);

  Widget get middleSection => Expanded(
      child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[VideoDescription(), ActionsToolbar()]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: Container()),
      body: Column(
        children: <Widget>[
          // Top section
          topSection,

          // Middle expanded
          middleSection,

          // Bottom Section
          BottomToolbar(),
        ],
      ),
    );
  }
}
