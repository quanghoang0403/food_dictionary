import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_dictionary/model/ingredient.dart';
import 'package:food_dictionary/data/ingredient_data.dart';
import 'package:food_dictionary/model/recipe.dart';
import 'package:food_dictionary/data/recipe_data.dart';
import 'package:food_dictionary/pages/detail_search01.dart';
import 'package:food_dictionary/pages/detail_search02.dart';
import 'package:food_dictionary/widgets/colors.dart';
import 'package:food_dictionary/widgets/style.dart';
import 'package:food_dictionary/widgets/search_box.dart';
import 'package:food_dictionary/widgets/tempFood.dart';
import 'package:food_dictionary/widgets/textTemPlate.dart';

class Create extends StatefulWidget {
  @override
  CreateState createState() => CreateState();
}

class CreateState extends State<Create> {
  List<Ingredient> ingredients;
  List<Ingredient> choosed_ingredients = [];
  List<Recipe> recipes =[];
  String query = '';

  @override
  void initState() {
    super.initState();
    ingredients = allIngredietnts;
    searchIngredient(query);
    searchRecipe(choosed_ingredients);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    // appBar: AppBar(
    //   title: PrimaryText(text: "Create Recipe from current ingredients"),
    //   centerTitle: true,
    //   backgroundColor: Colors.white,
    // ),
    body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          buildSearch(),
          Text(
            "Suggestion",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          Container(
              padding: EdgeInsets.all(2),
              height: 120,
              child: Align(
                alignment: Alignment.centerRight,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ingredients.length,
                  itemBuilder: (context, index) {
                    final ingredient = ingredients[index];
                    return buildIngredient(ingredient);
                  },
                ),
              )),
          Text(
            "Your Ingredient",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          Container(
              padding: EdgeInsets.all(2),
              height: 120,
              child: Align(
                alignment: Alignment.centerRight,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: choosed_ingredients.length,
                  itemBuilder: (context, index) {
                    final ingredient = choosed_ingredients[index];
                    print(choosed_ingredients[index]);
                    print(choosed_ingredients.length);
                    return buildIngredient(ingredient);
                  },
                ),
              )),
          Container(
            child: TextButton(onPressed: (){
              searchRecipe (choosed_ingredients);},
                child: PrimaryText(text:"Search Recipes", size: 18))
          ),
          Text(
            "Result",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          Container(
              padding: EdgeInsets.all(3),
              height: 120,
              child: Align(
                alignment: Alignment.centerRight,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recipes.length,
                  itemBuilder: (context, index) {
                    final recipe = recipes[index];
                    print(recipes[index]);
                    print(recipes.length);
                    return buildRecipe(recipe);
                  },
                ),
              )),
        ],
      )
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
    ),
  );

  Widget buildSearch() => SearchWidget(
    text: query,
    hintText: 'What ingredients you have',
    onChanged: searchIngredient,
  );


  Widget buildIngredient(Ingredient ingredient) => TextButton(
    child: Padding(
        padding: EdgeInsets.all(1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 65,
              width: 65,
              child: Image.asset(ingredient.urlImage, fit: BoxFit.cover),
            ),
            SizedBox(
              width: 65,
              height: 30,
              child:Center(
                child: Text(
                    ingredient.name,
                    style: TextStyle(
                      fontSize: 14,
                )
                  // fontWeight: FontWeight.bold,
                ),
              )
            )
          ],
        )),
    onPressed: () {
      ingredient.choosed += 1;
      print(ingredient.choosed);
      searchIngredient(query);
    },
  );
  Widget buildRecipe(Recipe recipe) => Container(
    child: Padding(
        padding: EdgeInsets.all(1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: Image.asset(recipe.urlImage, fit: BoxFit.cover),
            ),
            SizedBox(
                width: 65,
                height: 30,
                child:Center(
                  child: Text(
                      recipe.name,
                      style: TextStyle(
                        fontSize: 14,
                      )
                    // fontWeight: FontWeight.bold,
                  ),
                )
            )
          ],
        )),
  );

  void searchIngredient(String query) async {
    final ingredients = allIngredietnts.where((ingredient) {
      final titleLower = ingredient.name.toLowerCase();
      final searchLower = query.toLowerCase();
      final flat = ingredient.choosed % 2;
      return (titleLower.contains(searchLower)) &&
          (flat == 1);
    }).toList();
    final choosed_ingredients = allIngredietnts.where((ingredient) {
      final flat = ingredient.choosed % 2;
      return (flat == 0);
    }).toList();
    setState(() {
      this.query = query;
      this.ingredients = ingredients;
      this.choosed_ingredients = choosed_ingredients;
    });
  }

  void searchRecipe(List choosed_ingredients ){
    recipes= [];
    print("list$choosed_ingredients");
for (var i=0; i < choosed_ingredients.length; i++){
  for (var j=0; j<allRecipes.length; j++){
    for (var k=0; k< allRecipes[j].ingrdients.length; k++){
      if (choosed_ingredients[i].name == allRecipes[j].ingrdients[k].name){
        var flat = 0;
        for (var check=0; check< recipes.length; check++){
          if (allRecipes[j].name  == recipes[check].name ){
            flat = 1;
          };
        }
        if (flat == 0){
          recipes.add(allRecipes[j]);
        };
      }
    }
  }
}
setState(() {
  this.recipes = recipes;
});
print("recipe $recipes");
  }
}

