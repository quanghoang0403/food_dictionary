import 'dart:ffi';

import 'package:food_dictionary/model/ingredient.dart';
class Recipe {
  final int id;
  final String name;
  final String urlImage;
  List<Ingredient> ingredients = [];
  List<String> instructions = [];
  List<String> list_cate = [];
  List<double>  countIngre = [];
  final int favo;
  int favo_state = 1;
  final String calo;
  final String Total_Fat;
  final String Saturated_Fat;
  final String Cholesterol;
  final String Sodium;
  final String Total_Carbohydrate;
  final String Dietary_Fiber;
  final String Total_Sugars;
  final String Protein;
  final String Vitamin_D;
  final String Calcium;
  final String Iron;
  final String Potassium;
  final int time;
  final int servings;
  int choosed = 1;
  Recipe({
    this.id,
    this.name,
    this.urlImage,
    this.ingredients,
    this.list_cate,
    this.countIngre,
    this.favo,
    this.favo_state,
    this.servings,
    this.time,
    this.instructions,
    this.calo,
    this.Total_Fat,
    this.Saturated_Fat,
    this.Cholesterol,
    this.Sodium,
    this.Total_Carbohydrate,
    this.Dietary_Fiber,
    this.Total_Sugars,
    this.Protein,
    this.Vitamin_D,
    this.Calcium,
    this.Iron,
    this.Potassium,
    choosed = 1,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
    id: json['id'],
    name: json['name'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
  };
}
