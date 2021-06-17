import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  List<Ingredient> popular_ingredients = [
    allIngredietnts[0],
    allIngredietnts[5],
    allIngredietnts[10],
    allIngredietnts[2],
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

  Widget build(BuildContext context) {
    final controller = TextEditingController();
    List<Recipe> Recipes = allRecipes;

    //final user = FirebaseAuth.instance.currentUser;
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
                          height: 540,
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
                            child: Image.asset('assets/icons/avatar1.png', width: 137,),
                            ),

                        // Positioned(
                        //     top: 90,
                        //     left: 145,
                        //     child: CircleAvatar(
                        //   maxRadius: 60,
                        //   backgroundImage: NetworkImage(user.photoURL),
                        // )),
                        Positioned(
                          top: 237,
                          left: 131,
                          child: Column(

                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              PrimaryText(
                                text: 'Hoàng Đinh',
                                //text: user.displayName,
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
                                //text: user.email,
                                text: 'quanghoang0403@gmail.com',
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                size: 15,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                            top: 330,
                            left: 25,
                            child: Container(
                              height: 200,
                              width: 351,
                              decoration: BoxDecoration(
                                  //color: Colors.white,
                                //borderRadius: BorderRadius.circular(40)
                              ),
                              child: Positioned(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(width: 30),
                                    Row(children:  <Widget>[
                                      OutlineButton.icon(
                                          label: PrimaryText(
                                            text: '   Shopping List                                ',
                                            size: 17,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black87,
                                          ),
                                          shape: StadiumBorder(),
                                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                          highlightedBorderColor: Colors.black,
                                          borderSide: BorderSide(color: Colors.white12),
                                          textColor: Colors.blueGrey.shade600,
                                          icon: FaIcon(FontAwesomeIcons.shoppingCart, color: AppColors.cor2, size: 20),
                                          onPressed: () {
                                          },
                                        ),
                                      Icon(Icons.arrow_forward_ios, color: AppColors.cor2, size: 15,)
                                      ],
                                    ),
                                    Row(children:  <Widget>[
                                      OutlineButton.icon(
                                        label: PrimaryText(
                                          text: '    Recipes Plan                                 ',
                                          size: 17,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87,
                                        ),
                                        shape: StadiumBorder(),
                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                        highlightedBorderColor: Colors.black,
                                        borderSide: BorderSide(color: Colors.white12),
                                        textColor: Colors.blueGrey.shade600,
                                        icon: FaIcon(FontAwesomeIcons.book, color: AppColors.cor2,size: 20),
                                        onPressed: () {
                                        },
                                      ),
                                      Icon(Icons.arrow_forward_ios, color: AppColors.cor2, size: 15,)
                                    ],
                                    ),
                                    Row(children:  <Widget>[
                                      OutlineButton.icon(
                                        label: PrimaryText(
                                          text: '     Change Information                  ',
                                          size: 17,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87,
                                        ),
                                        shape: StadiumBorder(),
                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                        highlightedBorderColor: Colors.black,
                                        borderSide: BorderSide(color: Colors.white12),
                                        textColor: Colors.blueGrey.shade600,
                                        icon: FaIcon(FontAwesomeIcons.portrait, color: AppColors.cor2,size: 20),
                                        onPressed: () {
                                        },
                                      ),
                                      Icon(Icons.arrow_forward_ios, color: AppColors.cor2, size: 15,)
                                    ],
                                    ),
                                    Row(children:  <Widget>[
                                      OutlineButton.icon(
                                        label: PrimaryText(
                                          text: '    Log Out                                          ',
                                          size: 17,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87,
                                        ),
                                        shape: StadiumBorder(),
                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                        highlightedBorderColor: Colors.black,
                                        borderSide: BorderSide(color: Colors.white12),
                                        textColor: Colors.blueGrey.shade600,
                                        icon: FaIcon(FontAwesomeIcons.signOutAlt, color: AppColors.cor2,size: 20),
                                        onPressed: () {
                                        },
                                      ),
                                      Icon(Icons.arrow_forward_ios, color: AppColors.cor2, size: 15,)
                                    ],
                                    ),
                                  ]
                              ),)
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: TextForPromoButton(
                      title: 'My favorite Ingredients',
                      press: () {},
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
                  Container(height: 15,
                      color: Colors.grey.withOpacity(0.15)),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: TextForPromoButton(
                      title: 'My favorite Recipes',
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
                    padding: EdgeInsets.only(top: 3),
                    child: TextForPromoButton(
                      title: 'For my health',
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
}
