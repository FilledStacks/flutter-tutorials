import 'package:flutter/material.dart';

class NavBarItemMobile extends StatelessWidget {
  final String title;
  final IconData icon;
  final String navigationPath;
  const NavBarItemMobile(this.title, this.icon, this.navigationPath);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60),
      child: Row(
        children: <Widget>[
          Icon(icon),
          SizedBox(
            width: 30,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
