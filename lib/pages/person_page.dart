import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_dictionary/pages/show_more_page.dart';
import 'package:food_dictionary/pages/detail_recipe_page.dart';
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

import 'home_page.dart';

class Person extends StatelessWidget {
  List<Ingredient> ingredients;
  List<Ingredient> choosed_ingrdients = allIngredietnts;
  List<Recipe> favorite_recipes = allRecipes.where((item) {
    final favo_state = item.favo_state;
    final check = favo_state % 2;
    return (check == 0);
  }).toList();

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
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    List<Recipe> Recipes = allRecipes;

    final user = FirebaseAuth.instance.currentUser;
    Size size = MediaQuery.of(context).size;
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
                    Container(
                      padding: EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                        bottom: 36,
                      ),
                      height: 55,
                      decoration: BoxDecoration(
                        color: AppColors.cor2,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                    ),
                    Container(
                      height: 510,
                    ),
                    Positioned(
                      top: 10,
                      left: 162,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          PrimaryText(
                            text: 'Person',
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            size: 23,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 81,
                      left: 136,
                      child: Image.asset(
                        'assets/icons/avatar1.png',
                        width: 137,
                      ),
                    ),
                    Positioned(
                        top: 90,
                        left: 145,
                        child: CircleAvatar(
                      maxRadius: 60,
                      backgroundImage: NetworkImage(user.photoURL),
                    )),
                    Positioned(
                      top: 237,
                      left: 131,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          PrimaryText(
                            //text: 'Hoàng Đinh',
                            text: user.displayName,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            size: 25,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 273,
                      left: 93,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          PrimaryText(
                            text: user.email,
                            //text: 'quanghoang0403@gmail.com',
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        top: 310,
                        left: 25,
                        child: Container(
                            decoration: BoxDecoration(
                                //color: Colors.white,
                                //borderRadius: BorderRadius.circular(40)
                                ),
                            child: Column(children: <Widget>[
                              SizedBox(width: 30),
                              PersonButton(
                                title: "Shopping List",
                                icon: FontAwesomeIcons.shoppingCart,
                              ),
                              PersonButton(
                                title: "Recipes Plan",
                                icon: FontAwesomeIcons.book,
                              ),
                              PersonButton(
                                title: "Change Information",
                                icon: FontAwesomeIcons.portrait,
                              ),
                              PersonButton(
                                title: "Log Out",
                                icon: FontAwesomeIcons.signOutAlt,
                              ),
                            ]))),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: TextForPromoButton(
                  title: 'My favorite Recipes',
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ShowMoreRecipe(list: favorite_recipes, lastPage: 4,  name: 'My favorite Recipes')));
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
                        itemCount: favorite_recipes.length,
                        itemBuilder: (context, index) {
                          final recipe = favorite_recipes[index];
                          return TempRecipe(
                            recipe: recipe,
                            lastPage: 4,
                          );
                        }
                        // }));},
                        ),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 3),
                child: TextForPromoButton(
                  title: 'For my health',
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ShowMoreRecipe(list: healthy_recipes, lastPage: 4,  name: 'For my health')));
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
                            lastPage: 4,
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
}
