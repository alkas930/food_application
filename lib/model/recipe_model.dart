// recipe_model.dart
class Recipe {
  final int id;
  final String name;
  final String image;

  Recipe({required this.id, required this.name, required this.image});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}

class RecipeResponse {
  final List<Recipe> recipes;

  RecipeResponse({required this.recipes});

  factory RecipeResponse.fromJson(Map<String, dynamic> json) {
    var list = json['recipes'] as List;
    List<Recipe> recipeList = list.map((i) => Recipe.fromJson(i)).toList();
    return RecipeResponse(recipes: recipeList);
  }
}
