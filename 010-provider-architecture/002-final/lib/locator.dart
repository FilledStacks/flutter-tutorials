import 'package:get_it/get_it.dart';

import 'core/services/api.dart';
import 'core/services/authentication_service.dart';
import 'core/viewmodels/comments_model.dart';
import 'core/viewmodels/home_model.dart';
import 'core/viewmodels/login_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());

  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => CommentsModel());
}
