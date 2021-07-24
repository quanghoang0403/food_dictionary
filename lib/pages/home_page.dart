import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_dictionary/pages/show_more_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_dictionary/provider/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:food_dictionary/widgets/colors.dart';
import 'package:food_dictionary/widgets/style.dart';
import 'package:food_dictionary/widgets/tempFood.dart';
import 'package:food_dictionary/provider/cloud_firestore.dart';
import 'package:food_dictionary/widgets/search_box.dart';
import 'package:food_dictionary/widgets/custom_shape_clipper.dart';

//import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_dictionary/data/recipe_data.dart';
import 'package:food_dictionary/model/recipe.dart';
import 'package:food_dictionary/data/ingredient_data.dart';
import 'package:food_dictionary/model/ingredient.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Ingredient> ingredients;
  List<Ingredient> choosed_ingrdients = allIngredietnts;
  List<Ingredient> popular_ingredients = [
    allIngredietnts[9],
    allIngredietnts[5],
    allIngredietnts[25],
    allIngredietnts[8],
    allIngredietnts[4],
    allIngredietnts[17],
  ];
  List<Recipe> happy_mother_day_recipes = [
    allRecipes[14],
    allRecipes[2],
    allRecipes[4],
    allRecipes[6],
    allRecipes[12],
    allRecipes[17]
  ];
  List<Recipe> healthy_recipes = [
    allRecipes[13],
    allRecipes[8],
    allRecipes[4],
    allRecipes[5],
    allRecipes[3],
    allRecipes[11]
  ];
  List<Recipe> top_trending_recipes;
  String query = '';

  @override
  void initState() {
    super.initState();
    searchTopTrending();
    ingredients = allIngredietnts;
    searchIngredient(query);
    // Size size = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    List<Recipe> Recipes = allRecipes;

    final user = FirebaseAuth.instance.currentUser;
    Size size = MediaQuery.of(context).size;

    // return Stack(
    //         children: <Widget>[
    //     ClipPath(
    //     clipper: CustomShapeClipper(),
    //     child:
    //     Container(
    //         height: 300.0,
    //         decoration: BoxDecoration(
    //           gradient: LinearGradient(
    //             colors: [AppColors.cor2, Colors.amber],
    //           ),
    //         ),
    //     )),]
    // );
    return Scaffold(
      body: ListView(
        children: [
          SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                // margin: EdgeInsets.only(bottom: 5),
                // It will cover 20% of our total height
                // height: size.height * 0.17,
                child: Stack(
                  children: <Widget>[
                    ClipPath(
                        clipper: CustomShapeClipper(),
                        child: Container(
                          height: 190.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [AppColors.cor2, Colors.amber[600]],
                            ),
                          ),
                        )),
                    Positioned(
                      top: 15,
                      left: 30,
                      // padding: EdgeInsets.only(
                      //   left: 20.0,
                      //   right: 20.0,
                      //   bottom: 40,
                      // ),
                      // height: size.height * 0.17 - 27,
                      // decoration: BoxDecoration(
                      //   color: AppColors.cor2,
                      //   borderRadius: BorderRadius.only(
                      //     bottomLeft: Radius.circular(60),
                      //     bottomRight: Radius.circular(60),
                      //   ),
                      // ),
                      // Row(
                      //   children: <Widget>[
                      //     // FutureBuilder<DocumentSnapshot> (
                      //     //     future: collectionReference.doc('roots').get(),
                      //     //     builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                      //     //     print(snapshot.data);
                      //     //     if (snapshot.hasError) {
                      //     //       return Text("Something went wrong");
                      //     //     }
                      //     //
                      //     //     if (snapshot.hasData && !snapshot.data.exists) {
                      //     //       return Text("Document does not exist");
                      //     //     }
                      //     //
                      //     //     if (snapshot.connectionState == ConnectionState.done) {
                      //     //       Map<String, dynamic> data = snapshot.data.data();
                      //     //       return Text("Full Name: ${data['name']}");
                      //     //     }
                      //     //     return Text("loading");
                      //     //   }
                      //     // ),
                      //     // StreamBuilder(stream: Firestore.instance.collection('users').snapshots(),
                      //     //   builder: (context, snapshot) {
                      //     //     if (snapshot.hasError) {
                      //     //       return Text("Something went wrong");
                      //     //     }
                      //     //     return Text(snapshot.data.documents[0]['name']);
                      //
                      //     // if (snapshot.hasData && !snapshot.data.exists) {
                      //     //   return Text("Document does not exist");
                      //     // }
                      //     //
                      //     // if (snapshot.connectionState == ConnectionState.done) {
                      //     //   Map<String, dynamic> data = snapshot.data.data();
                      //     //   return Text(snapshot.data['color']);
                      //     // }
                      //     // return Text("loading");
                      //     //}
                      //     //),
                      //     SizedBox(width: 20),
                      //     // CircleAvatar(
                      //     //   maxRadius: 25,
                      //     //   backgroundImage: NetworkImage(user.photoURL),
                      //     // ),
                      //     SizedBox(width: 20),
                      //     Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: <Widget>[
                      //           PrimaryText(
                      //             text: 'Hello ',
                      //             //text: 'Hello ' + user.displayName,
                      //             size: 23,
                      //             fontWeight: FontWeight.w500,
                      //           ),
                      //           SizedBox(width: 20),
                      //           PrimaryText(text: 'What do you want to eat?', size: 20)
                      //         ])
                      //   ],
                      // ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          PrimaryText(
                            text: 'Hi !',
                            // text: 'Hi '+ user.displayName +'!',
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 60,
                      left: 0,
                      right: 0,
                      child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(children: <Widget>[
                            Expanded(
                              child: Container(
                                height: 55,
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      color:
                                          AppColors.lightGray.withOpacity(0.5),
                                    )),
                                child: GestureDetector(
                                  child: Row(
                                    children: [
                                      Icon(Icons.search, color: AppColors.cor2),
                                      SizedBox(width: 10),
                                      Text(
                                        "Search ingredient or recipe",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.8),
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    showSearch(
                                        context: context,
                                        delegate: DataSearch());
                                  },
                                ),
                              ),
                            ),
                          ])),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: TextForPromoButton(
                  title: 'Top Trending',
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ShowMoreRecipe(list: top_trending_recipes, lastPage: 0,  name: 'Top Trending')));
                  },
                ),
              ),
              Container(
                  padding: EdgeInsets.all(3),
                  height: 220,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: top_trending_recipes.length,
                        itemBuilder: (context, index) {
                          final recipe = top_trending_recipes[index];
                          return TempRecipe(
                            recipe: recipe,
                            lastPage: 0,
                          );
                        }
                        // }));},
                        ),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: TextForPromoButton(
                  title: 'Popular Ingredients',
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ShowMoreIngredient(list: popular_ingredients, lastPage: 0,  name: 'Popular Ingredients')));
                  },
                ),
              ),
              Container(
                  padding: EdgeInsets.only(bottom: 0),
                  height: 145,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: popular_ingredients.length,
                        itemBuilder: (context, index) {
                          final ingredient = popular_ingredients[index];
                          return TempIngredient(
                            ingredient: ingredient,
                            lastPage: 0,
                          );
                        }
                        // }));},
                        ),
                  )),
              Container(height: 15, color: Colors.grey.withOpacity(0.15)),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: TextForPromoButton(
                  title: 'Happy Mother day',
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ShowMoreRecipe(list: happy_mother_day_recipes, lastPage: 0,  name: 'Happy Mother day')));
                  },
                ),
              ),
              Container(
                  padding: EdgeInsets.all(3),
                  height: 220,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: happy_mother_day_recipes.length,
                        itemBuilder: (context, index) {
                          final recipe = happy_mother_day_recipes[index];
                          return TempRecipe(
                            recipe: recipe,
                            lastPage: 0,
                          );
                        }
                        // }));},
                        ),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 3),
                child: TextForPromoButton(
                  title: 'Good for health',
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ShowMoreRecipe(list: healthy_recipes, lastPage: 0,  name: 'Good for health')));
                  },
                ),
              ),
              Container(
                  padding: EdgeInsets.all(3),
                  height: 220,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: healthy_recipes.length,
                        itemBuilder: (context, index) {
                          final recipe = healthy_recipes[index];
                          return TempRecipe(
                            recipe: recipe,
                            lastPage: 0,
                          );
                        }
                        // }));},
                        ),
                  )),
            ],
          )),
        ],
      ),
    );
  }

  void searchIngredient(String query) async {
    final ingredients = allIngredietnts.where((item) {
      final titleLower = item.name.toLowerCase();
      final searchLower = query.toLowerCase();
      return (titleLower.contains(searchLower));
    }).toList();

    setState(() {
      this.query = query;
      this.ingredients = ingredients;
    });
  }

  void searchTopTrending() {
    final List<Recipe> tempList = allRecipes;
    for (var i = 0; i < tempList.length - 1; i++) {
      for (var j = i + 1; j < tempList.length; j++) {
        if (tempList[i].favo < tempList[j].favo) {
          final tempRecipe = tempList[i];
          tempList[i] = tempList[j];
          tempList[j] = tempRecipe;
        }
      }
    }
    final top_trending_recipes = [
      tempList[0],
      tempList[1],
      tempList[2],
      tempList[3],
      tempList[4],
      tempList[5],
    ];
    setState(() {
      this.top_trending_recipes = top_trending_recipes;
    });
  }
}

class DataSearch extends SearchDelegate<String> {
  List<Ingredient> ingredients;
  List<Recipe> recipes;
  List<Ingredient> suggest_ingredients;
  List<Recipe> suggest_recipes;
  final String searchFieldLabel = "Search recipe or ingredient";

  @override
  Widget TextField(searchFieldLabel) {
    return (TextField(searchFieldLabel));
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(
          Icons.clear,
          size: 25,
          color: AppColors.cor2,
        ),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(
        Icons.arrow_back_ios,
        size: 25,
        color: AppColors.cor2,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final ingredients = allIngredietnts.where((item) {
      final titleLower = item.name.toLowerCase();
      final searchLower = query.toLowerCase();
      return (titleLower.contains(searchLower));
    }).toList();
    final recipes = allRecipes.where((item) {
      final titleLower = item.name.toLowerCase();
      final searchLower = query.toLowerCase();
      return (titleLower.contains(searchLower));
    }).toList();
    if (ingredients.length > 0) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, left: 20),
              child: PrimaryText(
                text: 'Ingredients',
                color: AppColors.cor1,
                fontWeight: FontWeight.w500,
                size: 22,
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 5),
                height: 145,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: ingredients.length,
                      itemBuilder: (context, index) {
                        final ingredient = ingredients[index];
                        return TempIngredient(
                          ingredient: ingredient,
                          lastPage: 0,
                        );
                      }
                      // }));},
                      ),
                )),
            Container(
              margin: EdgeInsets.only(top: 10, left: 20),
              child: PrimaryText(
                text: 'Recipes',
                color: AppColors.cor1,
                fontWeight: FontWeight.w500,
                size: 22,
              ),
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
                          lastPage: 0,
                        );
                      })),
                )),
          ],
        ),
      );
    } else if (ingredients.length == 0) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, left: 30),
              child: PrimaryText(
                text: 'Recipes',
                color: AppColors.cor1,
                fontWeight: FontWeight.w500,
                size: 22,
              ),
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
                          lastPage: 0,
                        );
                      })),
                )),
          ],
        ),
      );
    }
    return Container(
      margin: EdgeInsets.only(top: 20, left: 100),
      child: BasicText(text: "No result can found"),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggest_ingredients = allIngredietnts.where((item) {
      final titleLower = item.name.toLowerCase();
      final searchLower = query.toLowerCase();
      return (titleLower.contains(searchLower));
    }).toList();
    final suggest_recipes = allRecipes.where((item) {
      final titleLower = item.name.toLowerCase();
      final searchLower = query.toLowerCase();
      return (titleLower.contains(searchLower));
    }).toList();
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(top: 10),
              height: 145,
              child: Align(
                alignment: Alignment.centerRight,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: suggest_ingredients.length,
                    itemBuilder: (context, index) {
                      final ingredient = suggest_ingredients[index];
                      return TempIngredient(
                        ingredient: ingredient,
                        lastPage: 0,
                      );
                    }
                    // }));},
                    ),
              )),
          Container(
              padding: EdgeInsets.all(3),
              height: 210,
              child: Align(
                alignment: Alignment.centerRight,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: suggest_recipes.length,
                    itemBuilder: (context, index) {
                      final recipe = suggest_recipes[index];
                      return TempRecipe(
                        recipe: recipe,
                        lastPage: 0,
                      );
                    }
                    // }));},
                    ),
              )),
        ],
      ),
    );
  }
}
