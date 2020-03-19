import 'package:flutter/material.dart';
import 'package:instaclone/screens/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      theme: ThemeData(
        primaryColor: Colors.black,
        primaryIconTheme: IconThemeData(color: Colors.black),
        primaryTextTheme: TextTheme(title: TextStyle(color: Colors.black, fontFamily: 'Aveny')),
        textTheme: TextTheme(title: TextStyle(color: Colors.black))
      ),
      home: Home(),
    );
  }
}