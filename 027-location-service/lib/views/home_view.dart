import 'package:flutter/material.dart';
import 'package:location_service/datamodels/user_location.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    return Scaffold(
      body: Center(
        child: Text(
            'Location: Lat:${userLocation.latitude}, Long: ${userLocation.longitude}'),
      ),
    );
  }
}
