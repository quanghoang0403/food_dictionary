import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_dictionary/model/recipe.dart';
import 'package:food_dictionary/pages/detail_ingredient_page.dart';
import 'package:food_dictionary/pages/detail_recipe_page.dart';
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
  List<Recipe> recipes = [];
  int flat = 0;
  String query = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(children: [
          SingleChildScrollView(
            child: Column(children:
            [
              Container(
                height: 120,
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                        bottom: 36,
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
                      left: 160,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          PrimaryText(
                            text: 'Recipe',
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
                                hintText: "Search recipe",
                                onChanged: searchRecipe,
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
                padding: EdgeInsets.only(top: 10, left: 40, right: 40),
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
              SizedBox(
                height: 10,
              ),
              Center(child: Builder(builder: (BuildContext context) {
                if (flat == 0) {
                  return Padding(
                      padding: EdgeInsets.only(top: 60),
                      child: Image(
                        image: AssetImage(
                            "assets/images/search01/search_recipe.png"),
                        height: 270,
                        width: 270,
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
                              lastPage: 2,
                            );
                        })),
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
    final recipes = allRecipes.where((item) {
      final titleLower = item.name.toLowerCase();
      final searchLower = query.toLowerCase();
      return (titleLower.contains(searchLower));
    }).toList();
    if (query.length > 0 && recipes.length > 0) {
      setState(() {
        this.query = query;
        this.recipes = recipes;
        this.flat = 1;
      });
    } else {
      setState(() {
        this.query = query;
        this.recipes = [];
        this.flat = 0;
      });
    }
  }
}