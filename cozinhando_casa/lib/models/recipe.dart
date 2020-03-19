class Recipe {
  String title;
  String image;
  String serving;
  List<String> ingredients;
  List<String> instructions;

  Recipe(
      {this.title,
      this.image,
      this.serving,
      this.ingredients,
      this.instructions});

  Recipe.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    serving = json['serving'];
    //When using array in json, to import it, you have to cast with the type which the array returns
    ingredients = json['ingredients'].cast<String>();
    instructions = json['instructions'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['serving'] = this.serving;
    data['ingredients'] = this.ingredients;
    data['instructions'] = this.instructions;
    return data;
  }
}