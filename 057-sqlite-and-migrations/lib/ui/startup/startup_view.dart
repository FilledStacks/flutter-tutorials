import 'package:flutter/material.dart';
import 'package:sqflite_migration_example/ui/startup/startup_viewmodel.dart';
import 'package:stacked/stacked.dart';

/// [StartupView] will be shown right after the native splash screen
/// and will initialise everything required for the app to function.
///
/// After initialisation the ViewModel will navigate to the intended view
class StartupView extends StatelessWidget {
  const StartupView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              Text('Preparing app ... '),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => StartupViewModel(),
      onModelReady: (model) => model.initialise(),
    );
  }
}
