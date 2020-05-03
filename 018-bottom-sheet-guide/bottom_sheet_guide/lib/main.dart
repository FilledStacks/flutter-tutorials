import 'package:bottom_sheet_guide/bottomsheet_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: HomeView());
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MyFloatingButton(),
    );
  }
}

class MyFloatingButton extends StatefulWidget {
  @override
  _MyFloatingButtonState createState() => _MyFloatingButtonState();
}

class _MyFloatingButtonState extends State<MyFloatingButton> {
  bool _show = true;
  @override
  Widget build(BuildContext context) {
    return _show
        ? FloatingActionButton(
            onPressed: () {
              var sheetController = showBottomSheet(
                  context: context,
                  builder: (context) => BottomSheetWidget());
              
              _showButton(false);

              sheetController.closed.then((value) {
                _showButton(true);
              });
            },
          )
        : Container();
  }

  void _showButton(bool value) {
    setState(() {
      _show = value;
    });
  }
}

