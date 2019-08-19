import 'package:abstraction_example/services/api/api.dart';
import 'package:abstraction_example/services/api/fake_api.dart';
import 'package:abstraction_example/services/api/http_api.dart';
import 'package:provider/provider.dart';

const bool USE_FAKE_IMPLEMENTATION = true;

List<SingleChildCloneableWidget> provders = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];
List<SingleChildCloneableWidget> independentServices = [
  Provider<Api>.value(value: USE_FAKE_IMPLEMENTATION ? FakeApi() : HttpApi())
];
List<SingleChildCloneableWidget> dependentServices = [];
List<SingleChildCloneableWidget> uiConsumableProviders = [];
