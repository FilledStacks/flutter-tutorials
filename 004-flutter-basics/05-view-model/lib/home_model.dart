import 'dart:async';

enum HomeViewState { Busy, DataRetrieved, NoData }

class HomeModel {

  // Controller for the stream
  final StreamController<HomeViewState> _stateController = StreamController<HomeViewState>();

  // Items that are retrieved
  List<String> listItems;

  // Stream that broadcasts the home state
  Stream<HomeViewState> get homeState => _stateController.stream;
  
  // Actual business logic
  Future getListData({bool hasError = false, bool hasData = true}) async {
    _stateController.add(HomeViewState.Busy);
    await Future.delayed(Duration(seconds: 2));

    if (hasError) {
     return _stateController.addError(
          'An error occurred while fetching the data. Please try again later.');
    }

    if (!hasData) {
      return _stateController.add(HomeViewState.NoData);
    }

    listItems = List<String>.generate(10, (index) => '$index title');
    _stateController.add(HomeViewState.DataRetrieved);
  }
}