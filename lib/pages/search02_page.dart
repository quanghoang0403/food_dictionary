import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_dictionary/model/recipe.dart';
import 'package:food_dictionary/pages/detail_search01.dart';
import 'package:food_dictionary/pages/detail_search02.dart';
import 'package:food_dictionary/widgets/colors.dart';
import 'package:food_dictionary/widgets/style.dart';
import 'package:food_dictionary/widgets/search_box.dart';
import 'package:food_dictionary/widgets/tempFood.dart';
import 'package:food_dictionary/widgets/textTemPlate.dart';
import 'package:food_dictionary/data/recipe_data.dart';

class Search02 extends StatefulWidget {
  @override
  _Search02State createState() => _Search02State();
}
class _Search02State extends State<Search02> {
  List<bool> optionSelected = [true, false, false];
  List<Recipe> Recipes = allRecipes;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: [
          SearchBox(
            title: "Search recipe here",
            onChanged: (value) {},
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
            padding: EdgeInsets.only(top: 10),
            child: TextForPromoButon(
              title: 'Happy Mother Day',
              press: () {},
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: <Widget>[
              TempFood(
                  size: size * 1.15,
                  image: "assets/images/home/cake1.jpg",
                  title: "Cake 01",
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailRecipe(recipe: Recipes[0],)));
                  }),
              TempFood(
                  size: size * 1.15,
                  image: "assets/images/home/cake2.jpg",
                  title: "Cake 02",
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailRecipe(recipe: Recipes[1],)));
                  }),
              TempFood(
                  size: size * 1.15,
                  image: "assets/images/home/cake3.png",
                  title: "Cake 03",
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailRecipe(recipe: Recipes[2],)));
                  }),
              TempFood(
                  size: size * 1.15,
                  image: "assets/images/home/cake4.jpg",
                  title: "Cake 04",
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailRecipe(recipe: Recipes[1],)));
                  }),
              TempFood(
                  size: size * 1.15,
                  image: "assets/images/home/cake5.jpg",
                  title: "Cake 05",
                  press: () {}),
              TempFood(
                  size: size * 1.15,
                  image: "assets/images/home/cake6.jpg",
                  title: "Cake 06",
                  press: () {}),
              TempFood(
                  size: size * 1.15,
                  image: "assets/images/home/cake7.jpg",
                  title: "Cake 07",
                  press: () {}),
            ]),
          ),
          TextForPromoButon(
            title: 'Trending Recipes',
            press: () {},
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  TempFood(
                      size: size,
                      image: "assets/images/home/img01.png",
                      title: "Meal 01",
                      press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailRecipe(recipe: Recipes[1],)));
                      }),
                  TempFood(
                      size: size,
                      image: "assets/images/home/img02.png",
                      title: "Meal 02",
                      press: () {}),
                  TempFood(
                      size: size,
                      image: "assets/images/home/img03.png",
                      title: "Meal 03",
                      press: () {}),
                  TempFood(
                      size: size,
                      image: "assets/images/home/img04.png",
                      title: "Meal 04",
                      press: () {}),
                  TempFood(
                      size: size,
                      image: "assets/images/home/img05.jpg",
                      title: "Meal 05",
                      press: () {}),
                  TempFood(
                      size: size,
                      image: "assets/images/home/img06.png",
                      title: "Meal 06",
                      press: () {}),
                ],
              )),
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
}

