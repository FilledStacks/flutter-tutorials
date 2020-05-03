import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_architecture/datamodels/drawer_item_data.dart';

class DrawerOptionTabletPortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemData = Provider.of<DrawerItemData>(context);
    return Container(
      width: 152,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            itemData.iconData,
            size: 45,
          ),
          Text(itemData.title, style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
