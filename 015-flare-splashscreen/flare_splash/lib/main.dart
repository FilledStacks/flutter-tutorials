import 'package:flutter/material.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flare Welcome',
      home: SplashScreen(
        'assets/splash.flr',
        (context) => HomeView(),
        startAnimation: 'intro',
        backgroundColor: Color(0xff181818),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181818),
      body: Center(
        child: Text(
          'Home View',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
