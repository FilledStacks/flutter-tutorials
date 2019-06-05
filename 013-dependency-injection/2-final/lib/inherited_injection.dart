import 'package:flutter/material.dart';

import 'app_info.dart';

class InheritedInjection extends InheritedWidget {
  final Widget child;
  final AppInfo _appInfo = AppInfo();

  InheritedInjection({Key key, this.child}) : super(key: key, child: child);

  AppInfo get appInfo => _appInfo;

  static InheritedInjection of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(InheritedInjection)
        as InheritedInjection);
  }

  @override
  bool updateShouldNotify(InheritedInjection oldWidget) {
    return true;
  }
}
