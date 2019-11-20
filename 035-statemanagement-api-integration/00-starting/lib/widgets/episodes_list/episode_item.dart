import 'package:flutter/material.dart';

class EpisodeItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double duration;
  const EpisodeItem({
    Key key,
    this.imageUrl,
    this.title,
    this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 180,
            width: 300,
            child: Container(color: Colors.grey[300]),
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
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                Text(
                  '$duration minutes',
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
