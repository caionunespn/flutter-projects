import 'package:flutter/material.dart';
import 'package:instaclone/components/FeedList.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(
          child: FeedList()
        )
      ],
    );
  }
}