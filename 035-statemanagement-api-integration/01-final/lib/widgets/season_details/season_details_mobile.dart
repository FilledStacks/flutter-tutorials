import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:the_basics/datamodels/season_details_model.dart';
import 'package:the_basics/styles/text_styles.dart';

class SeasonDetailsMobile extends ProviderWidget<SeasonDetailsModel> {
  @override
  Widget build(BuildContext context, SeasonDetailsModel details) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Column(
        children: <Widget>[
          Text(
            details.title,
            style: titleTextStyle(sizingInformation.deviceScreenType),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            details.description,
            style: descriptionTextStyle(sizingInformation.deviceScreenType),
          ),
        ],
      ),
    );
  }
}
