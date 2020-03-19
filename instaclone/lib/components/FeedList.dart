import 'package:flutter/material.dart';
import 'package:instaclone/components/StoriesList.dart';

class FeedList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;

    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => index == 0 ? SizedBox(
        child: StoriesList(),
        height: deviceSize.height * 0.2,
      ) : Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FeedItem(
            'https://avatars0.githubusercontent.com/u/20321685?s=460&v=4',
            'cn_u'
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Image.network(
              'https://i.ytimg.com/vi/bcWhRxvk0lI/maxresdefault.jpg',
              fit: BoxFit.cover
            )
          )
        ],
      )
    );
  }
}

class FeedItem extends StatelessWidget {

  final String _image;
  final String _username;

  FeedItem(this._image, this._username);

  Widget getAvatar(){
    return Container(
      height: 40.0,
      width: 40.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(this._image),
        )
      ),
    );
  }

  Widget getItemHeader(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            getAvatar(),
            SizedBox(
              width: 10.0
            ),
            Text(this._username, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: null
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
      child: getItemHeader()
    );
  }
}