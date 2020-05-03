import 'package:compound/services/analytics_service.dart';
import 'package:compound/services/authentication_service.dart';
import 'package:compound/services/cloud_storage_service.dart';
import 'package:compound/services/dynamic_link_service.dart';
import 'package:compound/services/firestore_service.dart';
import 'package:compound/services/push_notification_service.dart';
import 'package:compound/services/remote_config_service.dart';
import 'package:compound/utils/image_selector.dart';
import 'package:get_it/get_it.dart';
import 'package:compound/services/navigation_service.dart';
import 'package:compound/services/dialog_service.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => FirestoreService());
  locator.registerLazySingleton(() => CloudStorageService());
  locator.registerLazySingleton(() => ImageSelector());
  locator.registerLazySingleton(() => PushNotificationService());
  locator.registerLazySingleton(() => AnalyticsService());
  locator.registerLazySingleton(() => DynamicLinkService());

  var remoteConfigService = await RemoteConfigService.getInstance();
  locator.registerSingleton(remoteConfigService);
}
