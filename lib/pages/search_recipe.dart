import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_dictionary/model/recipe.dart';
import 'package:food_dictionary/pages/detail_ingredient.dart';
import 'package:food_dictionary/pages/detail_recipe.dart';
import 'package:food_dictionary/widgets/colors.dart';
import 'package:food_dictionary/widgets/style.dart';
import 'package:food_dictionary/widgets/search_box.dart';
import 'package:food_dictionary/widgets/tempFood.dart';
import 'package:food_dictionary/data/recipe_data.dart';

class Search02 extends StatefulWidget {
  @override
  _Search02State createState() => _Search02State();
}

class _Search02State extends State<Search02> {
  List<bool> optionSelected = [true, false, false];
  List<Recipe> recipes = allRecipes;
  List<Recipe> favorite_recipes = [allRecipes[10], allRecipes[7], allRecipes[15], allRecipes[12], allRecipes[18], allRecipes[17]];
  List<Recipe> healthy_recipes = [allRecipes[13], allRecipes[8], allRecipes[4], allRecipes[5], allRecipes[3], allRecipes[11]];

  String query = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: [
          SingleChildScrollView(
            child: Column(children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: PrimaryText(
                    text: "Recipes",
                    size: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 7, bottom: 20),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: SearchWidget(
                        text: query,
                        hintText: "Search recipe",
                        onChanged: searchRecipe,
                      ),
                    ),
                    // SvgPicture.asset("assets/icons/search.svg"),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 40, right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    option('Veg', 'assets/icons/salad.png', 0),
                    option('Rice', 'assets/icons/rice.png', 1),
                    option('Fruit', 'assets/icons/fruit.png', 2),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: TextForPromoButton(
                  title: 'Favorite',
                  press: () {},
                ),
              ),
              Container(
                  padding: EdgeInsets.all(3),
                  height: 216,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: favorite_recipes.length,
                        itemBuilder: (context, index) {
                          final recipe = favorite_recipes[index];
                          return TempRecipe(
                            recipe: recipe,
                            lastPage: 2,
                          );
                        }
                      // }));},
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: TextForPromoButton(
                  title: 'Good for health',
                  press: () {},
                ),
              ),
              Container(
                  padding: EdgeInsets.all(3),
                  height: 216,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: healthy_recipes.length,
                        itemBuilder: (context, index) {
                          final recipe = healthy_recipes[index];
                          return TempRecipe(
                            recipe: recipe,
                            lastPage: 2,
                          );
                        }
                      // }));},
                    ),
                  )),
            ]),
          )
        ]));
  }

  Widget option(String name, String image, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          optionSelected[index] = !optionSelected[index];
        });
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: optionSelected[index] ? AppColors.cor1 : Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(0, 0),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Row(
          children: [
            SizedBox(
              height: 32,
              width: 32,
              child: Image.asset(
                image,
                color: optionSelected[index] ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "$name",
              style: TextStyle(
                color: optionSelected[index] ? Colors.white : Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  void searchRecipe(String query) async {
    final ingredients = allRecipes.where((item) {
      final titleLower = item.name.toLowerCase();
      final searchLower = query.toLowerCase();
      return (titleLower.contains(searchLower));
    }).toList();

    setState(() {
      this.query = query;
      this.recipes = recipes;
    });
  }
}
