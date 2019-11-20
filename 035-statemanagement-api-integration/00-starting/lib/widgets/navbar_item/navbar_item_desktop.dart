import 'package:flutter/material.dart';

class NavBarItemTabletDesktop extends StatelessWidget {
  final String title;
  final String navigationPath;
  const NavBarItemTabletDesktop(this.title, this.navigationPath);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 18),
    );
  }
}
