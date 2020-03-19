import 'package:flutter/material.dart';
import 'package:cozinhando_casa/models/recipe.dart';

class Detail extends StatelessWidget {
  Detail(this._recipe);

  final Recipe _recipe;

  Widget renderListAsText({List<String> list, TextStyle style}) {
    return Column(
      children: list.map((item) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.only(bottom: 8.0),
            child: Text('• $item', style: style)
          )
        );
      }).toList()
    );
  }

  Widget renderText(Text text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container ( child: text )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_recipe.title)),
      body: ListView(
        children: <Widget>[
          Image.asset(_recipe.image),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                renderText(Text(_recipe.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.left,)),
                renderText(Text("Servings: ${_recipe.serving}", style: TextStyle(fontSize: 16))),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16.0), 
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: renderListAsText(list: _recipe.ingredients, style: TextStyle(
                      color: Colors.white
                    )),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16.0), 
                  child: renderListAsText(list: _recipe.instructions)
                ),
              ],
            )
          )
        ],
      )
    );
  }
}