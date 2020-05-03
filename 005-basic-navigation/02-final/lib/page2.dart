import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
          _popNavigationWithResult(context, 'from_back');
          return false;
        },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _popNavigationWithResult(context, 'from_button');
          },
        ),
        body: Container(
          child: Center(
            child: Text('Page 2',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }

  void _popNavigationWithResult(BuildContext context, dynamic result) {
    Navigator.pop(context, result);
  }
}
