import 'package:flutter/material.dart';

class VideoDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 70.0,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 10.0, 
                color: Colors.green[300],
                margin: EdgeInsets.only(top: 10.0)),
              Container(
                height: 10.0, 
                color: Colors.green[300],
                margin: EdgeInsets.only(top: 10.0)),
              Container(
                height: 10.0, 
                color: Colors.green[300],
                margin: EdgeInsets.only(top: 10.0)),
            ])
      )
    );
  }
}
