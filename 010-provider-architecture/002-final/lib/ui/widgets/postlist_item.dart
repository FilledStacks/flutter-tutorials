import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecutre/core/models/post.dart';

part 'postlist_item.g.dart';

// separation of design the data-binding
@widget
Widget postListItem(BuildContext context) {
  final post = Provider.of<Post>(context);
  return _PostListItem(
    onTap: () {
      Navigator.pushNamed(context, '/post', arguments: post);
    },
    title: Text(post.title),
    body: Text(post.body),
  );
}

@widget
Widget _postListItem({Widget title, Widget body, VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
                blurRadius: 3.0,
                offset: Offset(0.0, 2.0),
                color: Color.fromARGB(80, 0, 0, 0))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DefaultTextStyle.merge(
            child: title,
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16.0),
          ),
          DefaultTextStyle.merge(
            child: body,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}
