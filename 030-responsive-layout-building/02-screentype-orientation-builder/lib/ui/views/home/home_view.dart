import 'package:flutter/material.dart';
import 'package:responsive_architecture/ui/screentype_builder.dart';
import 'package:responsive_architecture/ui/views/home/home_mobile.dart';
import 'package:responsive_architecture/ui/views/home/home_tablet.dart';

class HomeView extends StatelessWidget {
  HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeBuilder(
      mobile: HomeMobile(),
      tablet: HomeTablet(),
    );
  }
}
