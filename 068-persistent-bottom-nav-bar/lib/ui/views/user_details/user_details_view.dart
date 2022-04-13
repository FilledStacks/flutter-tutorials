import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/models/user_model.dart';
import 'package:persistent_bottom_nav_bar/ui/views/user_details/user_details_viewmodel.dart';
import 'package:stacked/stacked.dart';

class UserDetailsView extends StatelessWidget {
  const UserDetailsView({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    log('UserDetailsView.build()');
    return ViewModelBuilder<UserDetailsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(user.name),
          centerTitle: true,
        ),
        body: Center(
          child: Text(user.email),
        ),
      ),
      viewModelBuilder: () => UserDetailsViewModel(),
    );
  }
}
