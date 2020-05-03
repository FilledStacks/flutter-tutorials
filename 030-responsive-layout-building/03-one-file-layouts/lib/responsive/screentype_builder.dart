import 'package:flutter/material.dart';
import 'package:responsive_architecture/enums/device_screen_type.dart';
import 'package:responsive_architecture/responsive/responsive_builder.dart';

class ScreenTypeBuilder extends StatelessWidget {
  // Mobile will be returned by default
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ScreenTypeBuilder(
      {Key key, @required this.mobile, this.tablet, this.desktop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      // If sizing indicates Tablet and we have a tablet widget then return
      if (sizingInformation.deviceScreenType == DeviceScreenType.Tablet) {
        if (tablet != null) {
          return tablet;
        }
      }

      // If sizing indicates desktop and we have a desktop widget then return
      if (sizingInformation.deviceScreenType == DeviceScreenType.Desktop) {
        if (desktop != null) {
          return desktop;
        }
      }

      // Return mobile layout if nothing else is supplied
      return mobile;
    });
  }
}
