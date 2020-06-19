import 'package:flutter/material.dart';
import 'package:location_service/services/location_service.dart';
import 'package:location_service/views/home_view.dart';
import 'package:provider/provider.dart';

import 'datamodels/user_location.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserLocation>(
        create: (context) => LocationService().locationStream,
        child: MaterialApp(title: 'Flutter Demo', home: HomeView()));
  }
}
