import 'package:cached_network_image/cached_network_image.dart';
import 'package:compound/models/post.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final Post post;
  final Function onDeleteItem;
  const PostItem({
    Key key,
    this.post,
    this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: post.imageUrl != null ? null : 60,
      margin: const EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // If the image is not null load the imageURL
                post.imageUrl != null
                    ? SizedBox(
                        height: 250,
                        child: CachedNetworkImage(
                          imageUrl: post.imageUrl,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      )
                    // If the image is null show nothing
                    : Container(),
                Text(post.title),
              ],
            ),
          )),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              if (onDeleteItem != null) {
                onDeleteItem();
              }
            },
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(blurRadius: 8, color: Colors.grey[200], spreadRadius: 3)
          ]),
    );
  }
}
