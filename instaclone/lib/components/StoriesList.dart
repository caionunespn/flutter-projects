import 'package:flutter/material.dart';

class StoriesList extends StatelessWidget {

  final Row topText = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text('Stories', style: TextStyle(fontWeight: FontWeight.bold)),
      Row(
        children: <Widget>[
          Icon(Icons.play_arrow),
          Text('Ver Tudo', style: TextStyle(fontWeight: FontWeight.bold))
        ],
      )
    ],
  );

  final Expanded stories = Expanded(
    child: Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            StoryItem('https://avatars0.githubusercontent.com/u/20321685?s=460&v=4'),
            StoryItem('https://avatars0.githubusercontent.com/u/20321685?s=460&v=4'),
            StoryItem('https://avatars0.githubusercontent.com/u/20321685?s=460&v=4'),
          ],
        ),
      )
    )
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          topText,
          stories,
        ],
      ),
    );
  }
}

class StoryItem extends StatelessWidget {

  final String _image;

  StoryItem(this._image);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
            this._image
          )
        )
      ),
      margin: EdgeInsets.symmetric(horizontal: 8.0)
    );
  }
}