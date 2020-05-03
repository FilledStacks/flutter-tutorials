import 'package:flutter/material.dart';
import 'package:responsive_architecture/enums/device_screen_type.dart';
import 'package:responsive_architecture/ui/responsive_builder.dart';
import 'package:responsive_architecture/ui/views/home/home_mobile.dart';
import 'package:responsive_architecture/ui/views/home/home_tablet.dart';

class HomeView extends StatelessWidget {
  HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.Mobile) {
          return HomeMobile(
            sizingInformation: sizingInformation,
          );
        }

        return HomeTablet(
          sizingInformation: sizingInformation,
        );
      },
    );
  }
}
