import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_arc/core/changenotifiers/widgets/posts_notifier.dart';
import 'package:provider_arc/ui/widgets/base_widget.dart';
import 'package:provider_arc/ui/widgets/postlist_item.dart';

class Posts extends StatelessWidget {
  const Posts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<PostsNotifier>(
      notifier: PostsNotifier(
        api: Provider.of(context),
        authenticationService: Provider.of(context),
      ),
      onNotifierReady: (model) => model.getPosts(),
      builder: (context, model, child) => model.busy
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: model.posts.length,
              itemBuilder: (context, index) => PostListItem(
                    post: model.posts[index],
                    onTap: () {
                      Navigator.pushNamed(context, 'post',
                          arguments: model.posts[index]);
                    },
                  ),
            ),
    );
  }
}
