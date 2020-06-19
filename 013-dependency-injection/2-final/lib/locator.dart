import 'package:get_it/get_it.dart';

import 'app_info.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => AppInfo());
}
