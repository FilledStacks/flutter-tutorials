import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Page 2',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
