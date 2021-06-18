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
  List<bool> optionSelected = [false, false, false, false];
  List<Recipe> recipes = allRecipes;
  String query = '';
  List<String> list_cate = [];

  @override
  void initState() {
    super.initState();
    query = '';
    searchRecipe(query);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
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
                padding: EdgeInsets.only(top: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      option('Vegan', 'assets/icons/salad.png', 0),
                      option('Low-Carb', 'assets/icons/low-carb.png', 1),
                      option('Low-Fat', 'assets/icons/low-fat.png', 2),
                      option('HCG', 'assets/icons/HCR.png', 3),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
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
          if (optionSelected[index] == true) {
            list_cate.add(name);
          } else {
            list_cate.remove(name);
          }
          searchRecipe(query);
        });
        print(list_cate);
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        height: 52,
        width: 75,
        decoration: BoxDecoration(
          color: optionSelected[index] ? AppColors.cor1 : Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
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
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 3),
              child: SizedBox(
                height: 26,
                width: 55,
                child: Image.asset(
                  image,
                  color: optionSelected[index] ? Colors.white : Colors.black,
                ),
              ),
            ),
            Text(
              "$name",
              style: TextStyle(
                color: optionSelected[index] ? Colors.white : Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
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
    List<Recipe> tempRecipe = [];
    for (var i = 0; i < recipes.length; i++) {
      var count = 0;
      var len = list_cate.length;
      print("list: $len");
      for (var j = 0; j< list_cate.length; j++){
        var check = false;
          for (var k =0; k< recipes[i].list_cate.length ; k++){
            if (recipes[i].list_cate[k] == list_cate [j]){
              check = true;
            }
          }
        if (check == true){
          count = count + 1;
          print ("count $count");
        }
        }
      if (count == list_cate.length)
        {
          tempRecipe.add(recipes[i]);
        }
      }
    setState(() {
      this.query = query;
      if (list_cate.length>0){
        this.recipes = tempRecipe;
      } else {
        this.recipes = recipes;
      }
    });
    }
}