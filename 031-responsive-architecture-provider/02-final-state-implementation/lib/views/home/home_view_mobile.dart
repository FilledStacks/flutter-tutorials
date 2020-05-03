/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape

import 'package:flutter/material.dart';
import 'package:responsive_architecture/viewmodels/home_viewmodel.dart';
import 'package:responsive_architecture/widgets/app_drawer/app_drawer.dart';
import 'package:responsive_architecture/widgets/base_model_widget.dart';

import 'home_view.dart';

class HomeMobilePortrait extends BaseModelWidget<HomeViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          model.updateTitle();
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: IconButton(
              icon: Icon(Icons.menu, size: 30),
              onPressed: () {
                _scaffoldKey?.currentState?.openDrawer();
              },
            ),
          ),
          Expanded(
            child: Center(
              child: Text(model.title),
            ),
          )
        ],
      ),
    );
  }
}

class HomeMobileLandscape extends BaseModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SecondView()));
        },
      ),
      body: Row(
        children: <Widget>[
          AppDrawer(),
          Expanded(
            child: Center(
              child: Text(
                model.title,
                style: TextStyle(fontSize: 35),
              ),
            ),
          )
        ],
      ),
    );
  }
}
