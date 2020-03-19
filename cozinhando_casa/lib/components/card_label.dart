import 'package:flutter/material.dart';

class CardLabel extends StatelessWidget{

  final String text;
  final TextStyle style;

  CardLabel({this.text, this.style});

  @override 
  Widget build(BuildContext context) {
    return Padding(
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                text, 
                style: style
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.start,
        ),
      padding: EdgeInsets.only(left: 8.0),
    );
  }
}