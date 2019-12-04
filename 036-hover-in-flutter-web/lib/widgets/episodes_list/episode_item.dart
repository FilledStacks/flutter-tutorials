import 'package:flutter/material.dart';
import 'package:the_basics/datamodels/episode_item_model.dart';
import 'package:the_basics/extensions/hover_extensions.dart';

class EpisodeItem extends StatelessWidget {
  final EpisodeItemModel model;
  const EpisodeItem({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: SizedBox(
        width: 360,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 180,
              child: Image.network(model.imageUrl, fit: BoxFit.cover,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    model.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                    softWrap: true,
                  ),
                  Text(
                    '${model.duration} minutes',
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ).showCursorOnHover;
  }
}
