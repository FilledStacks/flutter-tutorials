import 'package:abstraction_unit/services/api/api.dart';
import 'package:abstraction_unit/services/api/http_api.dart';
import 'package:abstraction_unit/services/storage/localstorage_service.dart';
import 'package:abstraction_unit/services/storage/storage_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<Api>(() => HttpApi());
  locator.registerLazySingleton<StorageService>(() => LocalStorageService());
}
