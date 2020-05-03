import 'package:flutter/material.dart';
import 'package:scoped_guide/scoped_models/home_model.dart';
import 'package:scoped_guide/ui/views/error_view.dart';
import 'package:scoped_guide/ui/views/success_view.dart';
import 'package:scoped_guide/ui/widgets/busy_overlay.dart';

import 'base_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      builder: (context, child, model) =>
       BusyOverlay(
        show: model.state == ViewState.Busy,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              var whereToNavigate = await model.saveData();
              if (whereToNavigate) {
                Navigator.push(context,MaterialPageRoute(builder: (context) => SuccessView(title: "Passed in from home")));
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ErrorView()));
              }
            },
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                _getStateUi(model.state),
                Text(model.title),
              ],
            ),
          ),
        ),
      )
    );
  }

  Widget _getStateUi(ViewState state) {
    switch (state) {
      case ViewState.Busy:
        return CircularProgressIndicator();
      case ViewState.Retrieved:
      default:
        return Text('Done');
    }
  }
}
