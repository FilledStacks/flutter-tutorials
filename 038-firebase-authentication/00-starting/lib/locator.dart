import 'package:get_it/get_it.dart';
import 'package:compound/services/navigation_service.dart';
import 'package:compound/services/dialog_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
}
