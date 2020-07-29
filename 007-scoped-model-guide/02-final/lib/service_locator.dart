import 'package:get_it/get_it.dart';
import 'package:scoped_guide/scoped_models/error_model.dart';
import 'package:scoped_guide/scoped_models/home_model.dart';
import 'package:scoped_guide/scoped_models/success_model.dart';
import 'package:scoped_guide/services/storage_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // register services
  locator.registerLazySingleton<StorageService>(() => StorageService());

  // register models
  locator.registerFactory<HomeModel>(() => HomeModel());
  locator.registerFactory<ErrorModel>(() => ErrorModel());
  locator.registerFactory<SuccessModel>(() => SuccessModel());
}
