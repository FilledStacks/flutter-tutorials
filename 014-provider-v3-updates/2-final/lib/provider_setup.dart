import 'package:provider/provider.dart';
import 'package:provider_arc/core/services/authentication_service.dart';

import 'core/services/api.dart';

List<SingleChildCloneableWidget> getProviders() {
  return [
    ...independentServices,
    ...dependentServices
  ];
}

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: Api())
];

List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<Api, AuthenticationService>(
    builder: (context, api, authenticationService) =>
        AuthenticationService(api: api),
  )
];
