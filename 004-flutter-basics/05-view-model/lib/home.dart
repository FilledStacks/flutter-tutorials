import 'package:flutter/material.dart';
import './home_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final model = HomeModel();

  @override
  void initState() {
    model.getListData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          // We want to refresh, but this actually does nothing. Which is the limitation
          model.getListData();
        }),
        backgroundColor: Colors.grey[900],
        body: StreamBuilder(
            stream: model.homeState,
            builder: (buildContext, snapshot) {
              if (snapshot.hasError) {
                return _getInformationMessage(snapshot.error);
              }

              // Use busy indicator instead of hasData from snapShot
              if (!snapshot.hasData || snapshot.data == HomeViewState.Busy) {
                return Center(child: CircularProgressIndicator());
              }

              // use explicit state instead of checking the lenght
              if (snapshot.data == HomeViewState.NoData) {
                return _getInformationMessage(
                    'No data found for your account. Add something and check back.');
              }

              return ListView.builder(
                  itemCount: model.listItems.length,
                  itemBuilder: (buildContext, index) =>
                      _getListItemUi(index, model.listItems));
            }));
  }

  Widget _getListItemUi(int index, List<String> listItems) {
    return Container(
      margin: EdgeInsets.all(5.0),
      height: 50.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: Colors.grey[600]),
      child: Center(
        child: Text(
          listItems[index],
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _getInformationMessage(String message) {
    return Center(
        child: Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.w900, color: Colors.grey[500]),
    ));
  }
}
