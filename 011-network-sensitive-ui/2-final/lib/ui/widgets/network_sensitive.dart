import 'package:flutter/material.dart';
import 'package:network_aware/enums/connectivity_status.dart';
import 'package:provider/provider.dart';

class NetworkSensitive extends StatelessWidget {
  final Widget child;
  final double opacity;

  NetworkSensitive({
    this.child,
    this.opacity = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    // Get our connection status from the provider
    var connectionStatus = Provider.of<ConnectivityStatus>(context);

    if (connectionStatus == ConnectivityStatus.WiFi) {
      return child;
    }

    if (connectionStatus == ConnectivityStatus.Cellular) {
      return Opacity(
        opacity: opacity,
        child: child,
      );
    }

    return Opacity(
      opacity: 0.1,
      child: child,
    );
  }
}
