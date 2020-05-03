import 'package:flutter/material.dart';
import 'package:responsive_architecture/ui/sizing_information.dart';

class AppDrawerMobile extends StatelessWidget {
  final SizingInformation sizingInformation;
  const AppDrawerMobile({Key key, this.sizingInformation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizingInformation.orientation == Orientation.landscape ? 100 : 250,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 16, color: Colors.black12),
        ],
      ),
    );
  }
}
