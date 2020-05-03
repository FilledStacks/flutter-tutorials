import 'package:flutter/material.dart';
import 'package:responsive_architecture/enums/device_screen_type.dart';
import 'package:responsive_architecture/ui/responsive_builder.dart';
import 'package:responsive_architecture/ui/views/home/drawer/app_drawer_mobile.dart';

import 'app_drawer_tablet.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.Mobile) {
        return AppDrawerMobile(
          sizingInformation: sizingInformation,
        );
      }

      return AppDrawerTablet(
        sizingInformation: sizingInformation,
      );
    });
  }
}
