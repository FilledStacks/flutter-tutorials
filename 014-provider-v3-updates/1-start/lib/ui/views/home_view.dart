import 'package:flutter/material.dart';
import 'package:provider_arc/ui/shared/app_colors.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Center(child: Text('Home View')));
  }
}
