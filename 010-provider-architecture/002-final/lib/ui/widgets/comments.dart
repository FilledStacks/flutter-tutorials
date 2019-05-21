import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecutre/core/enums/viewstate.dart';
import 'package:provider_architecutre/core/models/comment.dart';
import 'package:provider_architecutre/core/models/post.dart';
import 'package:provider_architecutre/core/services/api.dart';
import 'package:provider_architecutre/core/viewmodels/comments_model.dart';
import 'package:provider_architecutre/ui/shared/app_colors.dart';
import 'package:provider_architecutre/ui/shared/ui_helpers.dart';

part 'comments.g.dart';

@widget
Widget comments(BuildContext context) {
  return ProxyChangeNotifierProvider2<Post, Api, CommentsModel>(
    builder: (context, post, api, previous) => (previous ?? CommentsModel())
      ..api = api
      ..postId = post.id,
    child: Consumer<CommentsModel>(
      builder: (context, model, child) => model.state == ViewState.Busy
          ? const Center(child: CircularProgressIndicator())
          : Expanded(
              child: ListView.builder(
                itemCount: model.comments.length,
                itemBuilder: (context, index) {
                  return Provider.value(
                    value: model.comments[index],
                    child: const CommentItem(),
                  );
                },
              ),
            ),
    ),
  );
}

/// Renders a single comment given a comment model
@widget
Widget commentItem(BuildContext context) {
  final comment = Provider.of<Comment>(context);
  return Container(
    padding: EdgeInsets.all(10.0),
    margin: EdgeInsets.symmetric(vertical: 10.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0), color: commentColor),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          comment.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        UIHelper.verticalSpaceSmall,
        Text(comment.body),
      ],
    ),
  );
}
