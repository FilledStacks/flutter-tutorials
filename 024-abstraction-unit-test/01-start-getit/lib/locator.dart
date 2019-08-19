import 'package:abstraction_unit/services/api.dart';
import 'package:abstraction_unit/services/localstorage_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => LocalStorageService());
}