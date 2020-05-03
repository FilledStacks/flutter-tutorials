import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        // We want to refresh, but this actually does nothing. Which is the limitation
        _getListData();
      }),
        backgroundColor: Colors.grey[900],
        body: FutureBuilder(
          future: _getListData(),
          builder: (buildContext, snapshot) {

            if(snapshot.hasError) {
              return _getInformationMessage(snapshot.error);
            }

            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            var listItems = snapshot.data;
            if(listItems.length == 0) {
              return _getInformationMessage('No data found for your account. Add something and check back.');
            }

            return ListView.builder(
                itemCount: listItems.length,
                itemBuilder: (buildContext, index) => _getListItemUi(index, listItems));
          }
        ));
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

  Future<List<String>> _getListData(
      {bool hasError = false, bool hasData = true}) async {
    await Future.delayed(Duration(seconds: 2));

    if (hasError) {
      return Future.error(
          'An error occurred while fetching the data. Please try again later.');
    }

    if (!hasData) {
      return List<String>();
    }

    return List<String>.generate(10, (index) => '$index title');
  }
}
