import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/app/app.router.dart';
import 'package:persistent_bottom_nav_bar/ui/views/main/main_viewmodel.dart';
import 'package:stacked/stacked.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      builder: (context, model, child) => WillPopScope(
        onWillPop: () async {
          // If it's not on the first route in the bottom nav bar
          if (model.currentIndex != 0) {
            // Then pop to the first index
            model.setIndex(0);

            // And return false to prevent the default behavior of a back button
            return false;
          }
          // Let the default behavior handle the back button tap
          return true;
        },
        child: Scaffold(
          body: Stack(
            children: [
              _MainBody(
                index: 0,
                navigatorKey: model.postNavigationKey,
                initialRoute: MainViewRoutes.postsView,
              ),
              _MainBody(
                index: 1,
                navigatorKey: model.userNavigationKey,
                initialRoute: MainViewRoutes.usersView,
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.grey[400],
            currentIndex: model.currentIndex,
            onTap: model.setIndex,
            items: const [
              BottomNavigationBarItem(
                label: 'Posts',
                icon: Icon(Icons.list_alt),
              ),
              BottomNavigationBarItem(
                label: 'Users',
                icon: Icon(Icons.people),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => MainViewModel(),
    );
  }
}

class _MainBody extends ViewModelWidget<MainViewModel> {
  const _MainBody({
    Key? key,
    required this.index,
    required this.navigatorKey,
    required this.initialRoute,
  }) : super(key: key);

  final int index;
  final GlobalKey<NavigatorState>? navigatorKey;
  final String? initialRoute;

  @override
  Widget build(BuildContext context, viewModel) {
    return Offstage(
      offstage: viewModel.currentIndex != index,
      child: ExtendedNavigator(
        router: MainViewRouter(),
        navigatorKey: navigatorKey,
        initialRoute: initialRoute,
      ),
    );
  }
}
