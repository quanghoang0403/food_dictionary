import 'package:food_dictionary/model/recipe.dart';
import 'package:food_dictionary/data/ingredient_data.dart';
final allRecipes = <Recipe>[
  Recipe(
    id: 1,
    name: 'Meal 01',
    calo: 250,
    carbo: 15,
    protein: 70,
    urlImage:
    'assets/images/home/img01.png',
    ingrdients: [allIngredietnts[0], allIngredietnts[1], allIngredietnts[2], allIngredietnts[3]],
  ),
  Recipe(
    id: 2,
    name: 'Meal 02',
    calo: 300,
    carbo: 50,
    protein: 40,
    urlImage:
    'assets/images/home/img02.png',
    ingrdients: [allIngredietnts[0], allIngredietnts[1], allIngredietnts[2], allIngredietnts[3], allIngredietnts[4]],
  ),
  Recipe(
    id: 3,
    name: 'Meal 03',
    calo: 250,
    carbo: 19,
    protein: 80,
    urlImage:
    'assets/images/home/img03.png',
    ingrdients: [allIngredietnts[0], allIngredietnts[1], allIngredietnts[2], allIngredietnts[4], allIngredietnts[5]],
  ),
];
