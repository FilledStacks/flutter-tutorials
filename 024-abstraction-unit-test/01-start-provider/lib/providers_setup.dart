import 'package:abstraction_unit/services/api.dart';
import 'package:abstraction_unit/services/localstorage_service.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> providers = [
  Provider.value(value: LocalStorageService()),
  Provider.value(
    value: Api(),
  )
];
