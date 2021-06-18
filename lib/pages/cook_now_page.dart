import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_dictionary/model/ingredient.dart';
import 'package:food_dictionary/data/ingredient_data.dart';
import 'package:food_dictionary/model/recipe.dart';
import 'package:food_dictionary/data/recipe_data.dart';
import 'package:food_dictionary/pages/detail_ingredient_page.dart';
import 'package:food_dictionary/pages/detail_recipe_page.dart';
import 'package:food_dictionary/widgets/colors.dart';
import 'package:food_dictionary/widgets/style.dart';
import 'package:food_dictionary/widgets/search_box.dart';
import 'package:food_dictionary/widgets/tempFood.dart';

class Create extends StatefulWidget {
  @override
  CreateState createState() => CreateState();
}

class CreateState extends State<Create> {
  List<Ingredient> ingredients = allIngredietnts;
  List<Ingredient> choosed_ingredients = [];
  List<Recipe> recipes = [];
  String query = '';
 int flat2 = 0;

  @override
  void initState() {
    super.initState();
    searchRecipe(choosed_ingredients);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
          body: ListView(
        children: [
          SingleChildScrollView(
              child: Column(
            children: <Widget>[
              Container(
                height: 110,
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                        bottom: 20,
                      ),
                      height: 70,
                      decoration: BoxDecoration(
                        color: AppColors.cor2,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 140,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          PrimaryText(
                            text: 'Cook now!',
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            size: 23,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 0,
                      right: 0,
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: SearchWidget(
                                text: query,
                                hintText: "What ingredient you have",
                                onChanged: searchIngredient,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 32,
                child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 0),
                    child: PrimaryText(
                      size: 18,
                      color: AppColors.cor1,
                      text: "Suggestion",
                      fontWeight: FontWeight.w500,
                      height: 2.0,
                    )),
              ),
              Container(
                  padding: EdgeInsets.all(2),
                  height: 110,
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
              Container(
                height: 32,
                child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 0),
                    child: PrimaryText(
                      size: 18,
                      color: AppColors.cor1,
                      text: "Your ingredients",
                      fontWeight: FontWeight.w500,
                      height: 2.0,
                    )),
              ),
              Container(
                  padding: EdgeInsets.all(2),
                  height: 110,
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
              Center(
                child: GestureDetector(
                  onTap: () {
                    searchRecipe(choosed_ingredients);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      height: 35,
                      width: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.cor2.withOpacity(0.85),
                      ),
                      child: PrimaryText(
                        text: 'Search',
                        size: 21,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ),
              Center(child: Builder(builder: (BuildContext context) {
                if (flat2 == 0) {
                  return Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Image(
                        image: AssetImage(
                            "assets/images/search01/cook.png"),
                        height: 185,
                        width: 185,
                        fit: BoxFit.cover,
                      ));
                }
                return Container(
                  height: 5,
                );
              })),
              Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GridView.count(
                        crossAxisCount: 2,
                        scrollDirection: Axis.vertical,
                        padding:
                        EdgeInsets.only(bottom: 10, left: 5, right: 20),
                        shrinkWrap: true,
                        primary: false,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                        children: List.generate(recipes.length, (index) {
                          final item = recipes[index];
                          return TempRecipe(
                            recipe: item,
                            lastPage: 3,
                          );
                        })),
                  )),
            ],
          ))
        ],
      ));

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'What ingredients you have',
        onChanged: searchIngredient,
      );

  Widget buildIngredient(Ingredient ingredient) => InkWell(
      onTap: () {
        ingredient.choosed += 1;
        print(ingredient.choosed);
        searchIngredient(query);
        if (choosed_ingredients.length == 0){
          searchRecipe(choosed_ingredients);
        }
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) =>
        //             DetailIngredient(ingredient: ingredient)));
      },
      child: Container(
        margin: EdgeInsets.only(left: 20, bottom: 5, top: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 12.0,
              )
            ]),
        child: Column(
          children: [
            SizedBox(
              width: 85,
              height: 75,
              child: Image.asset(ingredient.urlImage),
            ),
            BasicText(
                text: (ingredient.name), size: 14, fontWeight: FontWeight.w400),
            // Divider(
            //   height: 1,
            //   thickness: 0.3,
            // )
          ],
        ),
      ));

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
                    child: Center(
                      child: Text(recipe.name,
                          style: TextStyle(
                            fontSize: 14,
                          )
                          // fontWeight: FontWeight.bold,
                          ),
                    ))
              ],
            )),
      );

  void searchIngredient(String query) async {
    final ingredients = allIngredietnts.where((ingredient) {
      final titleLower = ingredient.name.toLowerCase();
      final searchLower = query.toLowerCase();
      final flat = ingredient.choosed % 2;
      return (titleLower.contains(searchLower)) && (flat == 1);
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

  void searchRecipe(List choosed_ingredients) {
    recipes = [];
    if (choosed_ingredients.length>0){
      for (var i = 0; i < choosed_ingredients.length; i++) {
        for (var j = 0; j < allRecipes.length; j++) {
          for (var k = 0; k < allRecipes[j].ingredients.length; k++) {
            if (choosed_ingredients[i].name ==
                allRecipes[j].ingredients[k].name) {
              var flat = 0;
              for (var check = 0; check < recipes.length; check++) {
                if (allRecipes[j].name == recipes[check].name) {
                  flat = 1;
                }
                ;
              }
              if (flat == 0) {
                recipes.add(allRecipes[j]);
              }
            }
          }
        }
      }
    } else
      {
        recipes = [];
      }
    if (recipes.length > 0) {
      setState(() {
        this.query = query;
        this.recipes = recipes;
        this.flat2 = 1;
      });
    } else {
      setState(() {
        this.query = query;
        this.recipes = [];
        this.flat2 = 0;
      });
    }
  }
}
