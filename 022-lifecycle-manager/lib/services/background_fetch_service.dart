import 'package:lifecycle_manager/services/stoppable_service.dart';

class BackgroundFetchService extends StoppableService {
  @override
  void start() {
    super.start();

    // Start listeneing
    print('BackgroundFetchService Started $serviceStopped');
  }

  @override
  void stop() {
    super.stop();

    // stop listening
    print('BackgroundFetchService Stopped $serviceStopped');
  }
}