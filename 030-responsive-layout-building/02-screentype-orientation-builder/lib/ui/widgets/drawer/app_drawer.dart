import 'package:flutter/material.dart';
import 'package:responsive_architecture/ui/screentype_builder.dart';

import 'app_drawer_mobile.dart';
import 'app_drawer_tablet.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeBuilder(
      mobile: AppDrawerMobile(),
      tablet: AppDrawerTablet(),
    );
  }
}
