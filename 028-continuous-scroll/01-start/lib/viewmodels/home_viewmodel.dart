import 'package:flutter/widgets.dart';

class HomeViewModel extends ChangeNotifier {
  List<String> _items;
  List<String> get items => _items;

  HomeViewModel() {
    _items = List<String>.generate(15, (index) => 'Title $index');
  }
}
