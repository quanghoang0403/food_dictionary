import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_dictionary/pages/detail_recipe.dart';
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
    allIngredietnts[0],
    allIngredietnts[5],
    allIngredietnts[10],
    allIngredietnts[2],
    allIngredietnts[4],
    allIngredietnts[17],
  ];
  List<Recipe> happy_mother_day_recipes = [allRecipes[14], allRecipes[2], allRecipes[4], allRecipes[6], allRecipes[12], allRecipes[17]];
  List<Recipe> healthy_recipes = [allRecipes[13], allRecipes[8], allRecipes[4], allRecipes[5], allRecipes[3], allRecipes[11]];
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
    List<Recipe> Recipes = allRecipes;
    //Stream<DocumentSnapshot> snapshot =  FirebaseFirestore.instance.collection("users").doc('SO78wxSqJlg0yWu6U2ca').snapshots();
    //final CollectionReference collectionReference = FirebaseFirestore.instance.collection('plants');

    //final user = FirebaseAuth.instance.currentUser;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 5),
                // It will cover 20% of our total height
                height: size.height * 0.17,
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                        bottom: 40,
                      ),
                      height: size.height * 0.17 - 27,
                      decoration: BoxDecoration(
                        color: AppColors.cor2,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60),
                        ),
                      ),
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
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Hi em!',
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 10,
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
                                hintText: "Search recipe or ingredient",
                                onChanged: searchIngredient,
                              ),
                            ),
                            // SvgPicture.asset("assets/icons/search.svg"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: TextForPromoButton(
                  title: 'Top Trending',
                  press: () {},
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
                padding: EdgeInsets.only(top: 5),
                child: TextForPromoButton(
                  title: 'Popular Ingredients',
                  press: () {},
                ),
              ),
              Container(
                  padding: EdgeInsets.all(3),
                  height: 150,
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
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: TextForPromoButton(
                  title: 'Happy Mother day',
                  press: () {},
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
                padding: EdgeInsets.only(top: 5),
                child: TextForPromoButton(
                  title: 'Good for health',
                  press: () {},
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
