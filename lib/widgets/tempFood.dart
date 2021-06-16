import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_dictionary/pages/detail_recipe_page.dart';
import 'package:food_dictionary/widgets/colors.dart';
import 'package:food_dictionary/widgets/style.dart';
import 'package:food_dictionary/model/ingredient.dart';
import 'package:food_dictionary/model/recipe.dart';
import 'package:food_dictionary/pages/detail_ingredient_page.dart';

class TempRecipe extends StatelessWidget {
  const TempRecipe({
    Key key,
    @required this.recipe,
    @required this.lastPage,
  }) : super(key: key);

  final Recipe recipe;
  final int lastPage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DetailRecipe(recipe: recipe, lastPage: lastPage,)));
    },
        child: Container(
          margin: EdgeInsets.only(top: 5, left: 20),
          child: Column(children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Stack(children: <Widget>[
                  Container(
                    height: 150.0,
                    width: 160.0,
                    child: Image.asset(
                      recipe.urlImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 10.0,
                    top: 10.0,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(
                          Radius.circular(7.0),
                        ),
                      ),
                      child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(
                              Icons.favorite,
                              color: AppColors.cor2,
                              size: 20,
                            ),
                            Text(
                              recipe.favo.toString(),
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black),
                            ),
                          ]),
                    ),
                  )
                ])),
            // Image.asset(image),
            Container(
              width: 160.0,
              padding: EdgeInsets.only(top: 8, bottom: 8),
              alignment: Alignment.center,
              //color: AppColors.cor1,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 20,
                      color: Colors.grey.withOpacity(0.15),
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RichText(
                      text: TextSpan(
                        text: recipe.name,
                        style: TextStyle(
                            fontSize: 15.2,
                            fontWeight: FontWeight.w500,
                            color: AppColors.cor1,
                            fontFamily: 'Poppins',
                            height: 1.3),
                      )
                  )
                ],
              ),
            )
          ]),
        ));
  }
}

class TempIngredient extends StatelessWidget {
  const TempIngredient({
    Key key,
    @required this.ingredient,
    @required this.lastPage,
  }) : super(key: key);

  final Ingredient ingredient;
  final int lastPage;
  @override
  Widget build(BuildContext context) => InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailIngredient(ingredient: ingredient, lastPage: lastPage,)));
      },
      child: Container(
        margin: EdgeInsets.only(left: 20, bottom: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 20),
                blurRadius: 20,
                color: Colors.grey.withOpacity(0.15),
              ),
            ]),
        child: Column(
          children: [
            SizedBox(
              width: 120,
              height: 105,
              child: Image.asset(ingredient.urlImage),
            ),
            BasicText(text: (ingredient.name), size: 16, fontWeight: FontWeight.w500),
            // Divider(
            //   height: 1,
            //   thickness: 0.3,
            // )
          ],
        ),
      ));
}
