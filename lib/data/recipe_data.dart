import 'package:food_dictionary/model/recipe.dart';
import 'package:food_dictionary/data/ingredient_data.dart';
final allRecipes = <Recipe>[
  Recipe(
    id: 1,
    name: 'Spicy Corn Shrimp',
    urlImage:
    'assets/images/home/img01.png',
    ingredients: [allIngredietnts[17], allIngredietnts[29], allIngredietnts[19], allIngredietnts[14]],
    countIngre: [1, 2, 1, 4],
    servings: 2,
    time: 10,
    instructions: [
      'Heat a grill or grill pan over medium heat. Toss the shrimp with olive oil, paprika, cayenne, salt, and pepper. Cook for about 2 to 3 minutes on each side, until shrimp are opaque.',
      'Cook your corn. Use a serrated knife to cut the top half inch off of your corn. Then microwave on high for 3 minutes. Peel away the husk and remove corn from the cob once cool enough to touch.',
      'Dice cucumbers and tomatoes. Toss with 1 tablespoon olive oil, plus salt and pepper to taste.',
      'Mix mayonnaise, yogurt, lemon juice, garlic, dill, mint, sea salt, and pepper. Spread evenly on corn with a spoon or small spatula. Sprinkle feta cheese on corn.'],
    calo: '170',
    Total_Fat: '23g', Saturated_Fat: '4g', Cholesterol:'42mg', Sodium: '133mg', Total_Carbohydrate: '21g', Dietary_Fiber: '8g', Total_Sugars: '14g', Protein: '26g', Vitamin_D: '30mcg', Calcium :'11mg', Iron: '52mg', Potassium: '63mg',
  ),
  Recipe(
    id: 2,
    name: 'Tomato Fennel Stew',
    urlImage:
    'assets/images/home/img02.png',
    ingredients: [allIngredietnts[28], allIngredietnts[19], allIngredietnts[23], allIngredietnts[24]],
    countIngre: [3, 2, 2, 1],
    servings: 5,
    time: 60,
    instructions: [
      'Heat oven to 350 F',
      'Add oil to a medium pot and turn heat to medium. Add garlic, fennel, and onion and season with 3/4 teaspoon of salt. Cook for about 10 minutes until onions and fennel start to soften and turn translucent.',
      'Add tomatoes, dried oregano, fennel seed, garlic powder, onion powder, lemon peel, and pepper. Stir to combine. Add tied thyme and rosemary and gently submerge in tomato mixture.',
      'Bake in preheated oven for 15 minutes or until fish begins to flake apart easily with a fork.'
    ],
    calo: '171',
    Total_Fat: '13g', Saturated_Fat: '1g', Cholesterol:'47mg', Sodium: '244mg', Total_Carbohydrate: '11g', Dietary_Fiber: '3g', Total_Sugars: '4g', Protein: '6g', Vitamin_D: '0mcg', Calcium :'116mg', Iron: '72mg', Potassium: '23mg',
  ),
  Recipe(
    id: 3,
    name: 'Greek Brown Rice Salad',
    urlImage:
    'assets/images/home/img03.png',
    ingredients: [allIngredietnts[22], allIngredietnts[19], allIngredietnts[14], allIngredietnts[15]],
    countIngre: [1, 2, 1, 3],
    servings: 4,
    time: 30,
    calo: '120',
    instructions: [
      'Heat oven to 250 F',
      'In a medium saucepan, bring water to a boil over high heat. Stir in rice, reduce the heat, cover and simmer until rice is tender and water has been absorbed, 35 to 40 minutes. Remove from the heat and allow rice to steam for 5 more minutes with the lid on. Then, remove the lid and allow the rice to cool until it is close to room temperature.',
      'Stir in the salt, pepper, lemon juice, olive oil, herbs, scallion greens, crumbled feta, cherry tomatoes, walnuts, and cucumber. Serve promptly, or refrigerate tightly covered until serving.'],
    Total_Fat: '10g', Saturated_Fat: '4g', Cholesterol:'36mg', Sodium: '24mg', Total_Carbohydrate: '13g', Dietary_Fiber: '32g', Total_Sugars: '34g', Protein: '16g', Vitamin_D: '0mcg', Calcium :'11mg', Iron: '52mg', Potassium: '213mg',
  ),
  Recipe(
    id: 4,
    name: 'Chicken Soup',
    urlImage:
    'assets/images/home/img01.png',
    ingredients: [allIngredietnts[0], allIngredietnts[10], allIngredietnts[25], allIngredietnts[16]],
    countIngre: [1, 2, 1, 4],
    servings: 2,
    time: 10,
    instructions: [
      'Heat a grill or grill pan over medium heat. Toss the shrimp with olive oil, paprika, cayenne, salt, and pepper. Cook for about 2 to 3 minutes on each side, until shrimp are opaque.',
      'Cook your corn. Use a serrated knife to cut the top half inch off of your corn. Then microwave on high for 3 minutes. Peel away the husk and remove corn from the cob once cool enough to touch.',
      'Dice cucumbers and tomatoes. Toss with 1 tablespoon olive oil, plus salt and pepper to taste.',
      'Mix mayonnaise, yogurt, lemon juice, garlic, dill, mint, sea salt, and pepper. Spread evenly on corn with a spoon or small spatula. Sprinkle feta cheese on corn.'],
    calo: '170',
    Total_Fat: '23g', Saturated_Fat: '4g', Cholesterol:'42mg', Sodium: '133mg', Total_Carbohydrate: '21g', Dietary_Fiber: '8g', Total_Sugars: '14g', Protein: '26g', Vitamin_D: '30mcg', Calcium :'11mg', Iron: '52mg', Potassium: '63mg',
  ),
  Recipe(
    id: 5,
    name: 'Mushroom Barley Chicken',
    urlImage:
    'assets/images/home/img02.png',
    ingredients: [allIngredietnts[25], allIngredietnts[22], allIngredietnts[25], allIngredietnts[12]],
    countIngre: [3, 2, 2, 1],
    servings: 5,
    time: 60,
    instructions: [
      'Heat oven to 350 F',
      'Add oil to a medium pot and turn heat to medium. Add garlic, fennel, and onion and season with 3/4 teaspoon of salt. Cook for about 10 minutes until onions and fennel start to soften and turn translucent.',
      'Add tomatoes, dried oregano, fennel seed, garlic powder, onion powder, lemon peel, and pepper. Stir to combine. Add tied thyme and rosemary and gently submerge in tomato mixture.',
      'Bake in preheated oven for 15 minutes or until fish begins to flake apart easily with a fork.'
    ],
    calo: '171',
    Total_Fat: '13g', Saturated_Fat: '1g', Cholesterol:'47mg', Sodium: '244mg', Total_Carbohydrate: '11g', Dietary_Fiber: '3g', Total_Sugars: '4g', Protein: '6g', Vitamin_D: '0mcg', Calcium :'116mg', Iron: '72mg', Potassium: '23mg',
  ),
  Recipe(
    id: 6,
    name: 'Vegetarian Egg Rolls',
    urlImage:
    'assets/images/home/img03.png',
    ingredients: [allIngredietnts[24], allIngredietnts[7], allIngredietnts[16], allIngredietnts[22]],
    countIngre: [1, 2, 1, 3],
    servings: 4,
    time: 30,
    calo: '120',
    instructions: [
      'Heat oven to 250 F',
      'In a medium saucepan, bring water to a boil over high heat. Stir in rice, reduce the heat, cover and simmer until rice is tender and water has been absorbed, 35 to 40 minutes. Remove from the heat and allow rice to steam for 5 more minutes with the lid on. Then, remove the lid and allow the rice to cool until it is close to room temperature.',
      'Stir in the salt, pepper, lemon juice, olive oil, herbs, scallion greens, crumbled feta, cherry tomatoes, walnuts, and cucumber. Serve promptly, or refrigerate tightly covered until serving.'],
    Total_Fat: '10g', Saturated_Fat: '4g', Cholesterol:'36mg', Sodium: '24mg', Total_Carbohydrate: '13g', Dietary_Fiber: '32g', Total_Sugars: '34g', Protein: '16g', Vitamin_D: '0mcg', Calcium :'11mg', Iron: '52mg', Potassium: '213mg',
  ),
  Recipe(
    id: 7,
    name: 'Teriyaki Chicken',
    urlImage:
    'assets/images/home/img01.png',
    ingredients: [allIngredietnts[25], allIngredietnts[15], allIngredietnts[11], allIngredietnts[16]],
    countIngre: [1, 2, 1, 4],
    servings: 2,
    time: 10,
    instructions: [
      'Heat a grill or grill pan over medium heat. Toss the shrimp with olive oil, paprika, cayenne, salt, and pepper. Cook for about 2 to 3 minutes on each side, until shrimp are opaque.',
      'Cook your corn. Use a serrated knife to cut the top half inch off of your corn. Then microwave on high for 3 minutes. Peel away the husk and remove corn from the cob once cool enough to touch.',
      'Dice cucumbers and tomatoes. Toss with 1 tablespoon olive oil, plus salt and pepper to taste.',
      'Mix mayonnaise, yogurt, lemon juice, garlic, dill, mint, sea salt, and pepper. Spread evenly on corn with a spoon or small spatula. Sprinkle feta cheese on corn.'],
    calo: '170',
    Total_Fat: '23g', Saturated_Fat: '4g', Cholesterol:'42mg', Sodium: '133mg', Total_Carbohydrate: '21g', Dietary_Fiber: '8g', Total_Sugars: '14g', Protein: '26g', Vitamin_D: '30mcg', Calcium :'11mg', Iron: '52mg', Potassium: '63mg',
  ),
  Recipe(
    id: 8,
    name: 'Vermicelli Sauce and Pork',
    urlImage:
    'assets/images/home/img02.png',
    ingredients: [allIngredietnts[28], allIngredietnts[14], allIngredietnts[16], allIngredietnts[22]],
    countIngre: [3, 2, 2, 1],
    servings: 5,
    time: 60,
    instructions: [
      'Heat oven to 350 F',
      'Add oil to a medium pot and turn heat to medium. Add garlic, fennel, and onion and season with 3/4 teaspoon of salt. Cook for about 10 minutes until onions and fennel start to soften and turn translucent.',
      'Add tomatoes, dried oregano, fennel seed, garlic powder, onion powder, lemon peel, and pepper. Stir to combine. Add tied thyme and rosemary and gently submerge in tomato mixture.',
      'Bake in preheated oven for 15 minutes or until fish begins to flake apart easily with a fork.'
    ],
    calo: '171',
    Total_Fat: '13g', Saturated_Fat: '1g', Cholesterol:'47mg', Sodium: '244mg', Total_Carbohydrate: '11g', Dietary_Fiber: '3g', Total_Sugars: '4g', Protein: '6g', Vitamin_D: '0mcg', Calcium :'116mg', Iron: '72mg', Potassium: '23mg',
  ),
  Recipe(
    id: 9,
    name: 'Low-Carb Broccoli',
    urlImage:
    'assets/images/home/img03.png',
    ingredients: [allIngredietnts[9], allIngredietnts[0], allIngredietnts[16], allIngredietnts[7]],
    countIngre: [1, 2, 1, 3],
    servings: 4,
    time: 30,
    calo: '120',
    instructions: [
      'Heat oven to 250 F',
      'In a medium saucepan, bring water to a boil over high heat. Stir in rice, reduce the heat, cover and simmer until rice is tender and water has been absorbed, 35 to 40 minutes. Remove from the heat and allow rice to steam for 5 more minutes with the lid on. Then, remove the lid and allow the rice to cool until it is close to room temperature.',
      'Stir in the salt, pepper, lemon juice, olive oil, herbs, scallion greens, crumbled feta, cherry tomatoes, walnuts, and cucumber. Serve promptly, or refrigerate tightly covered until serving.'],
    Total_Fat: '10g', Saturated_Fat: '4g', Cholesterol:'36mg', Sodium: '24mg', Total_Carbohydrate: '13g', Dietary_Fiber: '32g', Total_Sugars: '34g', Protein: '16g', Vitamin_D: '0mcg', Calcium :'11mg', Iron: '52mg', Potassium: '213mg',
  ),
  Recipe(
    id: 10,
    name: 'Strawberry Daiquiri Honey',
    urlImage:
    'assets/images/home/img01.png',
    ingredients: [allIngredietnts[1], allIngredietnts[7], allIngredietnts[8], allIngredietnts[5]],
    countIngre: [1, 2, 1, 4],
    servings: 2,
    time: 10,
    instructions: [
      'Heat a grill or grill pan over medium heat. Toss the shrimp with olive oil, paprika, cayenne, salt, and pepper. Cook for about 2 to 3 minutes on each side, until shrimp are opaque.',
      'Cook your corn. Use a serrated knife to cut the top half inch off of your corn. Then microwave on high for 3 minutes. Peel away the husk and remove corn from the cob once cool enough to touch.',
      'Dice cucumbers and tomatoes. Toss with 1 tablespoon olive oil, plus salt and pepper to taste.',
      'Mix mayonnaise, yogurt, lemon juice, garlic, dill, mint, sea salt, and pepper. Spread evenly on corn with a spoon or small spatula. Sprinkle feta cheese on corn.'],
    calo: '170',
    Total_Fat: '23g', Saturated_Fat: '4g', Cholesterol:'42mg', Sodium: '133mg', Total_Carbohydrate: '21g', Dietary_Fiber: '8g', Total_Sugars: '14g', Protein: '26g', Vitamin_D: '30mcg', Calcium :'11mg', Iron: '52mg', Potassium: '63mg',
  ),
  Recipe(
    id: 11,
    name: 'Coconut Mango Overnight',
    urlImage:
    'assets/images/home/img02.png',
    ingredients: [allIngredietnts[5], allIngredietnts[3], allIngredietnts[7], allIngredietnts[23]],
    countIngre: [3, 2, 2, 1],
    servings: 5,
    time: 60,
    instructions: [
      'Heat oven to 350 F',
      'Add oil to a medium pot and turn heat to medium. Add garlic, fennel, and onion and season with 3/4 teaspoon of salt. Cook for about 10 minutes until onions and fennel start to soften and turn translucent.',
      'Add tomatoes, dried oregano, fennel seed, garlic powder, onion powder, lemon peel, and pepper. Stir to combine. Add tied thyme and rosemary and gently submerge in tomato mixture.',
      'Bake in preheated oven for 15 minutes or until fish begins to flake apart easily with a fork.'
    ],
    calo: '171',
    Total_Fat: '13g', Saturated_Fat: '1g', Cholesterol:'47mg', Sodium: '244mg', Total_Carbohydrate: '11g', Dietary_Fiber: '3g', Total_Sugars: '4g', Protein: '6g', Vitamin_D: '0mcg', Calcium :'116mg', Iron: '72mg', Potassium: '23mg',
  ),
  Recipe(
    id: 12,
    name: 'Mango Banana Breakfast',
    urlImage:
    'assets/images/home/img03.png',
    ingredients: [allIngredietnts[4], allIngredietnts[7], allIngredietnts[3], allIngredietnts[5]],
    countIngre: [1, 2, 1, 3],
    servings: 4,
    time: 30,
    calo: '120',
    instructions: [
      'Heat oven to 250 F',
      'In a medium saucepan, bring water to a boil over high heat. Stir in rice, reduce the heat, cover and simmer until rice is tender and water has been absorbed, 35 to 40 minutes. Remove from the heat and allow rice to steam for 5 more minutes with the lid on. Then, remove the lid and allow the rice to cool until it is close to room temperature.',
      'Stir in the salt, pepper, lemon juice, olive oil, herbs, scallion greens, crumbled feta, cherry tomatoes, walnuts, and cucumber. Serve promptly, or refrigerate tightly covered until serving.'],
    Total_Fat: '10g', Saturated_Fat: '4g', Cholesterol:'36mg', Sodium: '24mg', Total_Carbohydrate: '13g', Dietary_Fiber: '32g', Total_Sugars: '34g', Protein: '16g', Vitamin_D: '0mcg', Calcium :'11mg', Iron: '52mg', Potassium: '213mg',
  ),
  Recipe(
    id: 13,
    name: 'Chicken Salad',
    urlImage:
    'assets/images/home/img01.png',
    ingredients: [allIngredietnts[25], allIngredietnts[1], allIngredietnts[11], allIngredietnts[23]],
    countIngre: [1, 2, 1, 4],
    servings: 2,
    time: 10,
    instructions: [
      'Heat a grill or grill pan over medium heat. Toss the shrimp with olive oil, paprika, cayenne, salt, and pepper. Cook for about 2 to 3 minutes on each side, until shrimp are opaque.',
      'Cook your corn. Use a serrated knife to cut the top half inch off of your corn. Then microwave on high for 3 minutes. Peel away the husk and remove corn from the cob once cool enough to touch.',
      'Dice cucumbers and tomatoes. Toss with 1 tablespoon olive oil, plus salt and pepper to taste.',
      'Mix mayonnaise, yogurt, lemon juice, garlic, dill, mint, sea salt, and pepper. Spread evenly on corn with a spoon or small spatula. Sprinkle feta cheese on corn.'],
    calo: '170',
    Total_Fat: '23g', Saturated_Fat: '4g', Cholesterol:'42mg', Sodium: '133mg', Total_Carbohydrate: '21g', Dietary_Fiber: '8g', Total_Sugars: '14g', Protein: '26g', Vitamin_D: '30mcg', Calcium :'11mg', Iron: '52mg', Potassium: '63mg',
  ),
  Recipe(
    id: 14,
    name: 'Baked Coconut Rice',
    urlImage:
    'assets/images/home/img02.png',
    ingredients: [allIngredietnts[5], allIngredietnts[22], allIngredietnts[24], allIngredietnts[17]],
    countIngre: [3, 2, 2, 1],
    servings: 5,
    time: 60,
    instructions: [
      'Heat oven to 350 F',
      'Add oil to a medium pot and turn heat to medium. Add garlic, fennel, and onion and season with 3/4 teaspoon of salt. Cook for about 10 minutes until onions and fennel start to soften and turn translucent.',
      'Add tomatoes, dried oregano, fennel seed, garlic powder, onion powder, lemon peel, and pepper. Stir to combine. Add tied thyme and rosemary and gently submerge in tomato mixture.',
      'Bake in preheated oven for 15 minutes or until fish begins to flake apart easily with a fork.'
    ],
    calo: '171',
    Total_Fat: '13g', Saturated_Fat: '1g', Cholesterol:'47mg', Sodium: '244mg', Total_Carbohydrate: '11g', Dietary_Fiber: '3g', Total_Sugars: '4g', Protein: '6g', Vitamin_D: '0mcg', Calcium :'116mg', Iron: '72mg', Potassium: '23mg',
  ),
  Recipe(
    id: 15,
    name: 'Chicken Fried Rice',
    urlImage:
    'assets/images/home/img03.png',
    ingredients: [allIngredietnts[25], allIngredietnts[22], allIngredietnts[7], allIngredietnts[8]],
    countIngre: [1, 2, 1, 3],
    servings: 4,
    time: 30,
    calo: '120',
    instructions: [
      'Heat oven to 250 F',
      'In a medium saucepan, bring water to a boil over high heat. Stir in rice, reduce the heat, cover and simmer until rice is tender and water has been absorbed, 35 to 40 minutes. Remove from the heat and allow rice to steam for 5 more minutes with the lid on. Then, remove the lid and allow the rice to cool until it is close to room temperature.',
      'Stir in the salt, pepper, lemon juice, olive oil, herbs, scallion greens, crumbled feta, cherry tomatoes, walnuts, and cucumber. Serve promptly, or refrigerate tightly covered until serving.'],
    Total_Fat: '10g', Saturated_Fat: '4g', Cholesterol:'36mg', Sodium: '24mg', Total_Carbohydrate: '13g', Dietary_Fiber: '32g', Total_Sugars: '34g', Protein: '16g', Vitamin_D: '0mcg', Calcium :'11mg', Iron: '52mg', Potassium: '213mg',
  ),
  Recipe(
    id: 16,
    name: 'Feta Oatmeal Bowl',
    urlImage:
    'assets/images/home/img01.png',
    ingredients: [allIngredietnts[24], allIngredietnts[22], allIngredietnts[27], allIngredietnts[11]],
    countIngre: [1, 2, 1, 4],
    servings: 2,
    time: 10,
    instructions: [
      'Heat a grill or grill pan over medium heat. Toss the shrimp with olive oil, paprika, cayenne, salt, and pepper. Cook for about 2 to 3 minutes on each side, until shrimp are opaque.',
      'Cook your corn. Use a serrated knife to cut the top half inch off of your corn. Then microwave on high for 3 minutes. Peel away the husk and remove corn from the cob once cool enough to touch.',
      'Dice cucumbers and tomatoes. Toss with 1 tablespoon olive oil, plus salt and pepper to taste.',
      'Mix mayonnaise, yogurt, lemon juice, garlic, dill, mint, sea salt, and pepper. Spread evenly on corn with a spoon or small spatula. Sprinkle feta cheese on corn.'],
    calo: '170',
    Total_Fat: '23g', Saturated_Fat: '4g', Cholesterol:'42mg', Sodium: '133mg', Total_Carbohydrate: '21g', Dietary_Fiber: '8g', Total_Sugars: '14g', Protein: '26g', Vitamin_D: '30mcg', Calcium :'11mg', Iron: '52mg', Potassium: '63mg',
  ),
  Recipe(
    id: 17,
    name: 'Honey Mustard Pork',
    urlImage:
    'assets/images/home/img02.png',
    ingredients: [allIngredietnts[7], allIngredietnts[27], allIngredietnts[8], allIngredietnts[0]],
    countIngre: [3, 2, 2, 1],
    servings: 5,
    time: 60,
    instructions: [
      'Heat oven to 350 F',
      'Add oil to a medium pot and turn heat to medium. Add garlic, fennel, and onion and season with 3/4 teaspoon of salt. Cook for about 10 minutes until onions and fennel start to soften and turn translucent.',
      'Add tomatoes, dried oregano, fennel seed, garlic powder, onion powder, lemon peel, and pepper. Stir to combine. Add tied thyme and rosemary and gently submerge in tomato mixture.',
      'Bake in preheated oven for 15 minutes or until fish begins to flake apart easily with a fork.'
    ],
    calo: '171',
    Total_Fat: '13g', Saturated_Fat: '1g', Cholesterol:'47mg', Sodium: '244mg', Total_Carbohydrate: '11g', Dietary_Fiber: '3g', Total_Sugars: '4g', Protein: '6g', Vitamin_D: '0mcg', Calcium :'116mg', Iron: '72mg', Potassium: '23mg',
  ),
  Recipe(
    id: 18,
    name: 'Spinach and Pesto Salmon',
    urlImage:
    'assets/images/home/img03.png',
    ingredients: [allIngredietnts[28], allIngredietnts[23], allIngredietnts[16], allIngredietnts[13]],
    countIngre: [1, 2, 1, 3],
    servings: 4,
    time: 30,
    calo: '120',
    instructions: [
      'Heat oven to 250 F',
      'In a medium saucepan, bring water to a boil over high heat. Stir in rice, reduce the heat, cover and simmer until rice is tender and water has been absorbed, 35 to 40 minutes. Remove from the heat and allow rice to steam for 5 more minutes with the lid on. Then, remove the lid and allow the rice to cool until it is close to room temperature.',
      'Stir in the salt, pepper, lemon juice, olive oil, herbs, scallion greens, crumbled feta, cherry tomatoes, walnuts, and cucumber. Serve promptly, or refrigerate tightly covered until serving.'],
    Total_Fat: '10g', Saturated_Fat: '4g', Cholesterol:'36mg', Sodium: '24mg', Total_Carbohydrate: '13g', Dietary_Fiber: '32g', Total_Sugars: '34g', Protein: '16g', Vitamin_D: '0mcg', Calcium :'11mg', Iron: '52mg', Potassium: '213mg',
  ),
  Recipe(
    id: 19,
    name: 'Coffee Coconut Shrimp',
    urlImage:
    'assets/images/home/img03.png',
    ingredients: [allIngredietnts[8], allIngredietnts[5], allIngredietnts[29], allIngredietnts[0]],
    countIngre: [1, 2, 1, 3],
    servings: 4,
    time: 30,
    calo: '120',
    instructions: [
      'Heat oven to 250 F',
      'In a medium saucepan, bring water to a boil over high heat. Stir in rice, reduce the heat, cover and simmer until rice is tender and water has been absorbed, 35 to 40 minutes. Remove from the heat and allow rice to steam for 5 more minutes with the lid on. Then, remove the lid and allow the rice to cool until it is close to room temperature.',
      'Stir in the salt, pepper, lemon juice, olive oil, herbs, scallion greens, crumbled feta, cherry tomatoes, walnuts, and cucumber. Serve promptly, or refrigerate tightly covered until serving.'],
    Total_Fat: '10g', Saturated_Fat: '4g', Cholesterol:'36mg', Sodium: '24mg', Total_Carbohydrate: '13g', Dietary_Fiber: '32g', Total_Sugars: '34g', Protein: '16g', Vitamin_D: '0mcg', Calcium :'11mg', Iron: '52mg', Potassium: '213mg',
  ),
];
