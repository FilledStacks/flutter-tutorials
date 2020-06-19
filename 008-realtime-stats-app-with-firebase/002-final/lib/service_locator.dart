import 'package:get_it/get_it.dart';
import 'package:skeleton_watcher/scoped_models/home_view_model.dart';
import 'package:skeleton_watcher/scoped_models/feedback_view_model.dart';
import 'package:skeleton_watcher/services/firebase_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Register services
  locator.registerLazySingleton(() => FirebaseService());

  // Register ScopedModels
  locator.registerFactory<HomeViewModel>(() => HomeViewModel());
  locator.registerFactory<FeedbackViewModel>(() => FeedbackViewModel());
}
