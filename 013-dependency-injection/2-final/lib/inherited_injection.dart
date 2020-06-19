import 'package:dependency_injection/app_info.dart';
import 'package:flutter/material.dart';

class InheritedInjection extends InheritedWidget {
  final AppInfo _appInfo = AppInfo();
  final Widget child;

  InheritedInjection({Key key, this.child}) : super(key: key, child: child);

  AppInfo get appInfo => _appInfo;

  static InheritedInjection of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<InheritedInjection>());
  }

  @override
  bool updateShouldNotify(InheritedInjection oldWidget) {
    return true;
  }
}
