import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/models/post_model.dart';
import 'package:persistent_bottom_nav_bar/ui/views/post_details/post_details_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PostDetailsView extends StatelessWidget {
  const PostDetailsView({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostDetailsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(post.title),
          centerTitle: true,
        ),
        body: Center(
          child: Text(post.body),
        ),
      ),
      viewModelBuilder: () => PostDetailsViewModel(),
    );
  }
}
