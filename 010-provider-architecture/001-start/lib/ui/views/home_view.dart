import 'package:flutter/material.dart';
import 'package:provider_architecutre/core/models/post.dart';
import 'package:provider_architecutre/ui/widgets/postlist_item.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  /// Returns a list list view of PostListItems
  Widget getPostsUi(List<Post> posts) => ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) => PostListItem(
            post: posts[index],
            onTap: () {
              Navigator.pushNamed(context, '/post', arguments: posts[index]);
            },
          ));
}
