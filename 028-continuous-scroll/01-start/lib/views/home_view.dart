import 'package:continuous_scroll/viewmodels/home_viewmodel.dart';
import 'package:continuous_scroll/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (context) => HomeViewModel(),
        child: Consumer<HomeViewModel>(
          builder: (context, model, child) => ListView.builder(
              itemCount: model.items.length,
              itemBuilder: (context, index) => ListItem(
                    title: model.items[index],
                  )),
        ),
      ),
    );
  }
}
