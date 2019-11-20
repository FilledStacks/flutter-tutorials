import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:the_basics/styles/text_styles.dart';

class SeasonDetails extends StatelessWidget {
  const SeasonDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'SEASON 1',
            style: titleTextStyle(sizingInformation.deviceScreenType),
          ),
          SizedBox(
            width: 50,
          ),
          Expanded(
            child: Text(
              'This season covers the absolute basics of Flutter Web Dev to get us up and running with a basic web app.',
              style: descriptionTextStyle(sizingInformation.deviceScreenType),
            ),
          )
        ],
      ),
    );
  }
}
