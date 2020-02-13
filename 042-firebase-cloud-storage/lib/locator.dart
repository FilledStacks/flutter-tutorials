import 'package:compound/services/authentication_service.dart';
import 'package:compound/services/cloud_storage_service.dart';
import 'package:compound/services/firestore_service.dart';
import 'package:compound/utils/image_selector.dart';
import 'package:get_it/get_it.dart';
import 'package:compound/services/navigation_service.dart';
import 'package:compound/services/dialog_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => FirestoreService());
  locator.registerLazySingleton(() => CloudStorageService());
  locator.registerLazySingleton(() => ImageSelector());
}
