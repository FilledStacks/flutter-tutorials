
import 'package:get_it/get_it.dart';
import 'package:lifecycle_manager/services/background_fetch_service.dart';
import 'package:lifecycle_manager/services/location_service.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => LocationService());
  locator.registerLazySingleton(() => BackgroundFetchService());
}