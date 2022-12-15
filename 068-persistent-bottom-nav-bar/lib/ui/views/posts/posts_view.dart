import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/ui/views/posts/posts_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PostsView extends StatelessWidget {
  const PostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.purple[100],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (final post in model.posts)
              ListTile(
                leading: Text(post.id),
                title: Text(post.title),
                subtitle: Text(post.body),
                onTap: () => model.onPostTap(post),
              ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      viewModelBuilder: () => PostsViewModel(),
    );
  }
}
