import 'package:dialog_manager/locator.dart';
import 'package:dialog_manager/services/dialog_service.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DialogManager extends StatefulWidget {
  final Widget child;
  DialogManager({Key key, this.child}) : super(key: key);

  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  DialogService _dialogService = locator<DialogService>();

  @override
  void initState() {
    super.initState();
    _dialogService.registerDialogListener(_showDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showDialog() {
    Alert(
        context: context,
        title: "FilledStacks",
        desc: "Flutter is awesome.",
        closeFunction: () => _dialogService.dialogComplete(),
        buttons: [
          DialogButton(
            child: Text('OkieDoke'),
            onPressed: () {
              _dialogService.dialogComplete();
              Navigator.of(context).pop();
            },
          )
        ]).show();
  }
}
