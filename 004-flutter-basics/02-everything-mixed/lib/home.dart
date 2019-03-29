import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> _pageData = List<String>();

  @override
  void initState() {
    _getListData().then((data) => 
        setState(() {
          _pageData = data;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: ListView.builder(
        itemCount: _pageData.length,
        itemBuilder: (buildContext, index) =>_getListItemUi(index)
    ));
  }

  Widget _getListItemUi(int index) {
    return  Container(
          margin: EdgeInsets.all(5.0),
          height: 50.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.grey[600]
          ),
          child: Center(
            child: Text(_pageData[index], style: TextStyle(color: Colors.white,),
        ),
          ),
      );
  }

  Future<List<String>> _getListData() async {
    await Future.delayed(Duration(seconds: 1));
    return List<String>.generate(10, (index) => '$index title');
  }
}
