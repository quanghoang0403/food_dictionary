import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_dictionary/model/ingredient.dart';
import 'package:food_dictionary/pages/detail_ingredient.dart';
import 'package:food_dictionary/pages/search_page.dart';
import 'package:food_dictionary/widgets/colors.dart';
import 'package:food_dictionary/widgets/style.dart';
import 'package:food_dictionary/widgets/search_box.dart';
import 'package:food_dictionary/widgets/tempFood.dart';

//import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_dictionary/data/ingredient_data.dart';
import 'package:food_dictionary/pages/create_from_ingre.dart';

class Search01 extends StatefulWidget {
  @override
  Search01State createState() => Search01State();
}

class Search01State extends State<Search01> {
  List<Ingredient> ingredients;
  List<Ingredient> choosed_ingrdients = allIngredietnts;
  String query = '';
  List<Ingredient> fruits = [allIngredietnts[1], allIngredietnts[2], allIngredietnts[3], allIngredietnts[4],];

  @override
  void initState() {
    super.initState();
    ingredients = allIngredietnts;
    searchIngredient(query);
  }

  // Size size = MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) => Scaffold(
          // backgroundColor: Colors.white,
          body: ListView(children: [
        SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: PrimaryText(
                    text: "Ingredients",
                    size: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 7, bottom: 17),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
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
                                        "Search ingredient",
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
                    // SvgPicture.asset("assets/icons/search.svg"),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Container(
                      alignment: Alignment.center,
                      height: 25,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.cor1.withOpacity(0.75),
                      ),
                      child: PrimaryText(
                        text: 'Categories',
                        size: 16,
                        color: Colors.white,
                      ))
                ),
              ),
              SizedBox(height: 10,),
              buildCategoryWidget(),
              Padding(
                padding: EdgeInsets.only(left: 5, right: 10),
                child: TextForPromoButton(
                  title: 'Fruit',
                  press: () {},
                ),
              ),
              Container(
                  padding: EdgeInsets.all(3),
                  // height: 150,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child:
                    // ListView.builder(
                    //     scrollDirection: Axis.horizontal,
                    //     itemCount: ingredients.length,
                    //     itemBuilder: (context, index) {
                    //       final ingredient = ingredients[index];
                           GridView.count(
                              crossAxisCount: 2,
                              // scrollDirection: Axis.vertical,
                              padding: EdgeInsets.only(bottom: 10, left: 10, right: 25),
                              shrinkWrap: true,
                              primary: false,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 1.15,
                              children: List.generate(fruits.length, (index) {
                                final item = fruits[index];
                          return TempIngredient(ingredient: item, lastPage: 1,);
                        })
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailIngredient(ingredient: ingredient)));
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

class DataSearch extends SearchDelegate<String> {
  List<Ingredient> ingredients;
  List<Ingredient> suggest_ingredients;
  final String searchFieldLabel = "Search ingredient";

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
    if (ingredients.length>0 ){
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(top: 40),
                padding: EdgeInsets.only(top: 10),
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
                          lastPage: 1,
                        );
                      }
                    // }));},
                  ),
                )),
          ],
        ),
      );
    }
    return Container(margin: EdgeInsets.only(top: 20, left: 100),
      child:BasicText(text: "No result can found"),);
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggest_ingredients = allIngredietnts.where((item) {
      final titleLower = item.name.toLowerCase();
      final searchLower = query.toLowerCase();
      return (titleLower.contains(searchLower));
    }).toList();
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(top: 40),
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
                        lastPage: 1,
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