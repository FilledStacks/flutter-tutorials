import 'package:flutter/material.dart';
import 'package:provider_arc/core/models/post.dart';
import 'package:provider_arc/ui/shared/app_colors.dart';

class PostView extends StatelessWidget {
  final Post post;
  const PostView({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Center(child: Text('Post View')));
  }
}
