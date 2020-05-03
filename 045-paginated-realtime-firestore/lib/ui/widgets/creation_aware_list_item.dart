import 'package:flutter/material.dart';

class CreationAwareListItem extends StatefulWidget {
  final Function itemCreated;
  final Widget child;
  const CreationAwareListItem({
    Key key,
    this.itemCreated,
    this.child,
  }) : super(key: key);

  @override
  _CreationAwareListItemState createState() => _CreationAwareListItemState();
}

class _CreationAwareListItemState extends State<CreationAwareListItem> {
  @override
  void initState() {
    super.initState();
    if (widget.itemCreated != null) {
      widget.itemCreated();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
