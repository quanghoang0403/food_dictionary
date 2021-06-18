import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_dictionary/model/ingredient.dart';
import 'package:food_dictionary/model/recipe.dart';
import 'package:food_dictionary/pages/detail_ingredient_page.dart';
import 'package:food_dictionary/pages/detail_recipe_page.dart';
import 'package:food_dictionary/widgets/colors.dart';
import 'package:food_dictionary/widgets/style.dart';
import 'package:food_dictionary/widgets/search_box.dart';
import 'package:food_dictionary/widgets/tempFood.dart';
import 'package:food_dictionary/data/recipe_data.dart';
import 'package:food_dictionary/control_page.dart';

class ShowMoreRecipe extends StatelessWidget {

  const ShowMoreRecipe({Key key, @required this.list, @required this.lastPage , @required this.name}) : super(key: key);

  final List list;
  final int lastPage;
  final String name;

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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 30,
                    margin: EdgeInsets.only(left: 20),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 25,
                        color: AppColors.cor2,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ControlPage(
                                  lastPage: lastPage,
                                )));
                      },
                    ),
                  ),
                  Container(
                      height: 40,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 5, left: 30, right: 30),
                      child: Text(name,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                            color: AppColors.cor2,
                          ))),
                  SizedBox(width: 30,)
                ],
              ),
              SizedBox(height: 10,),
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
                        children: List.generate(list.length, (index) {
                          final item = list[index];
                          return TempRecipe(
                            recipe: item,
                            lastPage: lastPage,
                          );
                        })),
                  )),
            ]),
          )
        ]));
  }
}

class ShowMoreIngredient extends StatelessWidget {

  const ShowMoreIngredient({Key key, @required this.list, @required this.lastPage , @required this.name}) : super(key: key);

  final List list;
  final int lastPage;
  final String name;

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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 30,
                    margin: EdgeInsets.only(left: 20),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 25,
                        color: AppColors.cor2,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ControlPage(
                                  lastPage: lastPage,
                                )));
                      },
                    ),
                  ),
                  Container(
                      height: 40,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 5, left: 30, right: 30),
                      child: Text(name,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                            color: AppColors.cor2,
                          ))),
                  SizedBox(width: 30,)
                ],
              ),
              SizedBox(height: 10,),
              Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GridView.count(
                        crossAxisCount: 2,
                        scrollDirection: Axis.vertical,
                        padding:
                        EdgeInsets.only( left: 15, right: 30),
                        shrinkWrap: true,
                        primary: false,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 20,
                        children: List.generate(list.length, (index) {
                          final item = list[index];
                          return TempIngredient(
                            ingredient: item,
                            lastPage: lastPage,
                          );
                        })),
                  )),
            ]),
          )
        ]));
  }
}

class ShowCate extends StatelessWidget {

  const ShowCate({Key key, @required this.list, @required this.lastPage , @required this.name}) : super(key: key);

  final List list;
  final int lastPage;
  final String name;

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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 30,
                    margin: EdgeInsets.only(left: 20),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 25,
                        color: AppColors.cor2,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ControlPage(
                                  lastPage: lastPage,
                                )));
                      },
                    ),
                  ),
                  Container(
                      height: 40,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 5, left: 30, right: 30),
                      child: Text(name,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                            color: AppColors.cor2,
                          ))),
                  SizedBox(width: 30,)
                ],
              ),
              SizedBox(height: 10,),
              Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GridView.count(
                        crossAxisCount: 2,
                        scrollDirection: Axis.vertical,
                        padding:
                        EdgeInsets.only( left: 15, right: 30),
                        shrinkWrap: true,
                        primary: false,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 20,
                        children: List.generate(list.length, (index) {
                          final item = list[index];
                          return TempIngredient(
                            ingredient: item,
                            lastPage: lastPage,
                          );
                        })),
                  )),
            ]),
          )
        ]));
  }
}