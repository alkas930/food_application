// api_service.dart
import 'dart:convert';

import 'package:food_application/model/recipe_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl =
      'https://dummyjson.com/recipes?limit=10&skip=10&select=name,image';

  Future<RecipeResponse> fetchRecipes() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      print(response.body);
      return RecipeResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}
