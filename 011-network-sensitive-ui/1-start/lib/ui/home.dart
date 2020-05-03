import 'package:flutter/material.dart';
import 'package:network_aware/ui/shared/app_colors.dart';
import 'package:network_aware/ui/widgets/stats_counter.dart';
import 'package:network_aware/ui/widgets/watcher_toolbar.dart';

double screenHeight(BuildContext context,
    {int dividedBy = 1, double decreasedBy = 0.0}) {
  assert(dividedBy != 0, "Don't divide by 0");
  return (MediaQuery.of(context).size.height - decreasedBy) / dividedBy;
}

class HomeView extends StatelessWidget {
  static const int CounterMargins = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Column(children: [
          WatcherToolbar(title: 'SKELETON-WATCHER'),
          _getHeightContainer(
            context: context,
            height:
                screenHeight(context, dividedBy: 2, decreasedBy: toolbarHeight),
            child: StatsCounter(
              size: screenHeight(context,
                      dividedBy: 2, decreasedBy: toolbarHeight) -
                  CounterMargins, // 60 margins
              count: 13,
              title: 'Errors',
              titleColor: Colors.red,
            ),
          ),
          _getHeightContainer(
              context: context,
              height: screenHeight(context,
                  dividedBy: 3, decreasedBy: toolbarHeight),
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    StatsCounter(
                      size: screenHeight(context,
                              dividedBy: 3, decreasedBy: toolbarHeight) -
                          CounterMargins,
                      count: 55,
                      title: 'Users',
                    ),
                    StatsCounter(
                      size: screenHeight(context,
                              dividedBy: 3, decreasedBy: toolbarHeight) -
                          CounterMargins,
                      count: 2,
                      title: 'Apps Created',
                    )
                  ])),
        ]));
  }

  Widget _getHeightContainer(
      {double height,
      BuildContext context,
      Widget child,
      bool hasTopStroke = false}) {
    return Container(
        height: height,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: child);
  }
}
