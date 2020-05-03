import 'package:flutter/material.dart';

class ActionsToolbar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      color: Colors.red[300],
      child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List<Widget>.generate(5, (index) => Container(
              width: 60, height: 60, 
              color: Colors.blue[300],
              margin: EdgeInsets.only(top: 20.0))),
          ),
    );
  }

}
