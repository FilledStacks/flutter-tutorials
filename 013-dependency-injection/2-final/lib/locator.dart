import 'package:get_it/get_it.dart';

import 'app_info.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerFactory(() => AppInfo());
}