import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_dictionary/model/ingredient.dart';
import 'package:food_dictionary/pages/detail_search01.dart';
import 'package:food_dictionary/pages/search_page.dart';
import 'package:food_dictionary/widgets/colors.dart';
import 'package:food_dictionary/widgets/style.dart';
import 'package:food_dictionary/widgets/search_box.dart';
import 'package:food_dictionary/widgets/tempFood.dart';
import 'package:food_dictionary/widgets/textTemPlate.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_dictionary/data/ingredient_data.dart';

class Search01 extends StatefulWidget {
  @override
  Search01State createState() => Search01State();
}

class Search01State extends State<Search01> {
  List<Ingredient> ingredients;
  List<Ingredient> choosed_ingrdients = allIngredietnts;
  String query = '';
  List<Ingredient> Ingredients = allIngredietnts;

  @override
  void initState() {
    super.initState();
    ingredients = allIngredietnts;
    searchIngredient(query);
  }
  // Size size = MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: [
          SearchWidget(
            text: query,
           hintText: "Search ingredient here",
            onChanged: searchIngredient,
          ),
        SizedBox(
          height: 10,
        ),
          SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                buildCategoryWidget(),
                SizedBox(height: 2),
                Padding(
                  padding: EdgeInsets.only(left: 3, right: 10),
                  child: TextForPromoButon(
                    title: 'FRUIT',
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
                            itemCount: ingredients.length,
                            itemBuilder: (context, index) {
                              final ingredient = ingredients[index];
                              // return GridView.count(
                              //     crossAxisCount: 2,
                              //     scrollDirection: Axis.vertical,
                              //     padding: EdgeInsets.only(bottom: 24, left: 24, right: 24),
                              //     shrinkWrap: true,
                              //     primary: false,
                              //     crossAxisSpacing: 16,
                              //     mainAxisSpacing: 12,
                              //     childAspectRatio: 1.15,
                              //     children: List.generate(ingredients.length, (index) {
                              //       final item = allIngredietnts[index];
                              return buildProductWidget(ingredient);}
                            // }));},
                          ),
                        )),
                // buildProductWidget(context),
              ]))
        ]));
  List category = [
    {
      'icon': "assets/images/search01/category/01.png",
      'name': 'Milk',
      'color': Color(0xffA4DEF1),
    },
    {
      'icon': "assets/images/search01/category/02.png",
      'name': 'Fruit',
      'color': Color(0xff82D07B),
    },
    {
      'icon': "assets/images/search01/category/03.png",
      'name': 'Veg',
      'color': Color(0xffF5CC22)
    },
    {
      'icon': "assets/images/search01/category/04.png",
      'name': 'Meat',
      'color': Color(0xffFCA393)
    },
    {
      'icon': "assets/images/search01/category/05.png",
      'name': 'Veg',
      'color': Color(0xffFEEE5E)
    },
    {
      'icon': "assets/images/search01/category/06.png",
      'name': 'Veg',
      'color': Color(0xffFFBE58)
    },
  ];

  Widget buildCategoryWidget() {
    return Container(
      height: 100,
      // margin: EdgeInsets.only(top: 8),
      // padding: EdgeInsets.only(top: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 24),
        itemCount: category.length,
        itemBuilder: (context, i) {
          var item = category.elementAt(i);
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                        color: item['color'],
                        borderRadius: BorderRadius.circular(12)),
                    child: Image.asset(
                      item['icon'],
                      color: Colors.white,
                    )),
                BasicText(text: (item['name']), size: 16)
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildProductWidget(Ingredient ingredient) =>
    // return GridView.count(
    //     crossAxisCount: 2,
    //     scrollDirection: Axis.vertical,
    //     padding: EdgeInsets.only(bottom: 24, left: 24, right: 24),
    //     shrinkWrap: true,
    //     primary: false,
    //     crossAxisSpacing: 16,
    //     mainAxisSpacing: 12,
    //     childAspectRatio: 1.15,
    //     children: List.generate(ingredients.length, (index) {
    //       final item = allIngredietnts[index];
          InkWell(
            onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=> DetailIngredient(ingredient: ingredient)));
          },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 12.0,
                      )
                    ]),
                child: Column(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 100,
                      child: Image.asset(ingredient.urlImage),
                    ),
                    BasicText(text: (ingredient.name), size: 18),
                    Spacer(),
                    // Divider(
                    //   height: 1,
                    //   thickness: 0.3,
                    // )
                  ],
                ),
              ));

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
}