import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:cozinhando_casa/models/recipe.dart';
import 'package:cozinhando_casa/components/card_label.dart';
import 'package:cozinhando_casa/screens/home/detail.dart';

const _titleAppBar = "Cozinhando em Casa";

class Home extends StatefulWidget {
  @override 
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CardList(),
        appBar: AppBar(
          title: Text(_titleAppBar),
        ),
      );
  }
}

class CardList extends StatelessWidget{
  @override 
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString('assets/receitas.json'),
      builder: (context, snapshot) {
        List<dynamic> recipes = json.decode(snapshot.data.toString());
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            final Recipe recipe = Recipe.fromJson(recipes[index]);
            return FoodCard(recipe);
          },
          itemCount: recipes == null ? 0 : recipes.length,
        );
      }
    );
  }
}

class FoodCard extends StatelessWidget {

  final Recipe _recipe;
  
  FoodCard(this._recipe);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Detail(_recipe);
        }));
      },
      child: Card(
              margin: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Image.asset(this._recipe.image, fit: BoxFit.cover),
                      Column(
                        children: <Widget>[
                          SizedBox(
                            child: Container(
                              child: CardLabel(
                                text: this._recipe.title, 
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black87
                              )
                            ),
                            width: double.infinity,
                            height: 40
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.end,
                      )
                    ],
                  )
                ],
              )
            ),
    );
  }
}