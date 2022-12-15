import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/ui/views/users/users_viewmodel.dart';
import 'package:stacked/stacked.dart';

class UsersView extends StatelessWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('UsersView.build()');
    return ViewModelBuilder<UsersViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.purpleAccent[100],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (final user in model.users)
              ListTile(
                trailing: CircleAvatar(child: Text(user.id)),
                title: Text(user.name),
                subtitle: Text(user.email),
                onTap: () => model.onUserTap(user),
              ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      viewModelBuilder: () => UsersViewModel(),
    );
  }
}
