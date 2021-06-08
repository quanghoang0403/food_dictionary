import 'package:food_dictionary/model/recipe.dart';
import 'package:food_dictionary/data/ingredient_data.dart';
final allRecipes = <Recipe>[
  Recipe(
    id: 1,
    name: 'Meal 01',
    urlImage:
    'assets/images/home/img01.png',
    ingredients: [allIngredietnts[0], allIngredietnts[1], allIngredietnts[2], allIngredietnts[3]],
    countIngre: [1, 2, 1/2, 3],
    servings: 12,
    time: 60,
    instructions: [
      'Heat oven to 350 F',
      'Lightly coat a 9x5-inch loaf pan with cooking spray and set aside. If you have a 2-cup liquid measuring cup, use it as this makes it easier to measure the wet ingredients.',
      'Lightly coat a 9x5-inch loaf pan with cooking spray and set aside. If you have a 2-cup liquid measuring cup, use it as this makes it easier to measure the wet ingredients.'],
    calo: '170',
    Total_Fat: '13g', Saturated_Fat: '1g', Cholesterol:'47mg', Sodium: '244mg', Total_Carbohydrate: '11g', Dietary_Fiber: '3g', Total_Sugars: '4g', Protein: '6g', Vitamin_D: '0mcg', Calcium :'116mg', Iron: '72mg', Potassium: '23mg',
  ),
  Recipe(
    id: 2,
    name: 'Meal 02',
    urlImage:
    'assets/images/home/img02.png',
    countIngre: [1, 2, 1/2, 3],
    servings: 5,
    time: 60,
    instructions: [
      'Heat oven to 350 F',
      'Lightly coat a 9x5-inch loaf pan with cooking spray and set aside. If you have a 2-cup liquid measuring cup, use it as this makes it easier to measure the wet ingredients.',
      'Lightly coat a 9x5-inch loaf pan with cooking spray and set aside. If you have a 2-cup liquid measuring cup, use it as this makes it easier to measure the wet ingredients.'],
    calo: '171',
    Total_Fat: '13g', Saturated_Fat: '1g', Cholesterol:'47mg', Sodium: '244mg', Total_Carbohydrate: '11g', Dietary_Fiber: '3g', Total_Sugars: '4g', Protein: '6g', Vitamin_D: '0mcg', Calcium :'116mg', Iron: '72mg', Potassium: '23mg',
  ),
  Recipe(
    id: 3,
    name: 'Meal 03',
    urlImage:
    'assets/images/home/img03.png',
    ingredients: [allIngredietnts[0], allIngredietnts[1], allIngredietnts[2], allIngredietnts[4], allIngredietnts[5]],
    countIngre: [1, 2, 1/2, 3],
    servings: 12,
    time: 60,
    calo: '120',
    instructions: [
      'Heat oven to 350 F',
      'Lightly coat a 9x5-inch loaf pan with cooking spray and set aside. If you have a 2-cup liquid measuring cup, use it as this makes it easier to measure the wet ingredients.',
      'Lightly coat a 9x5-inch loaf pan with cooking spray and set aside. If you have a 2-cup liquid measuring cup, use it as this makes it easier to measure the wet ingredients.'],
    Total_Fat: '13g', Saturated_Fat: '1g', Cholesterol:'47mg', Sodium: '244mg', Total_Carbohydrate: '11g', Dietary_Fiber: '3g', Total_Sugars: '4g', Protein: '6g', Vitamin_D: '0mcg', Calcium :'116mg', Iron: '72mg', Potassium: '23mg',

  ),
];
