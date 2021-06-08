import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_dictionary/data/recipe_data.dart';
import 'package:food_dictionary/model/ingredient.dart';
import 'package:food_dictionary/widgets/colors.dart';
import 'package:food_dictionary/widgets/style.dart';
import 'package:food_dictionary/pages/search_page.dart';
import 'package:food_dictionary/pages/search02_page.dart';
import 'package:food_dictionary/widgets/search_box.dart';
import 'package:food_dictionary/widgets/tempFood.dart';
import 'package:food_dictionary/widgets/textTemPlate.dart';
import 'package:food_dictionary/model/recipe.dart';

class DetailRecipe extends StatelessWidget {
  final Recipe recipe;

  DetailRecipe({@required this.recipe});

  @override
  Widget build(BuildContext context) {
    // var count = recipe.ingrdients.length();
    return Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
            toolbarHeight: 70,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 24,
                  color: AppColors.cor2,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchPage(selected_Tab: 1)));
                }),
            actions: [
              Expanded(
                  child: Column(children: [
                SizedBox(
                  height: 10,
                ),
                Text(recipe.name,
                    style: TextStyle(
                      color: AppColors.cor2,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    )),
                // BasicText(text: "So good, bae!", size: 18),
              ])),
            ]),
        body: DefaultTabController(
            length: 3,
            child: NestedScrollView(
                physics: NeverScrollableScrollPhysics(),
                headerSliverBuilder: (context, isScolled) {
                  return [
                    SliverAppBar(
                      backgroundColor: Colors.white,
                      collapsedHeight: 330,
                      expandedHeight: 330,
                      flexibleSpace: Container(
                        height: 320,
                        padding: EdgeInsets.only(left: 16),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Nutrition",
                                    style: TextStyle(
                                      color: AppColors.cor1,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    )),
                                SizedBox(
                                  height: 16,
                                ),
                                buildNutrition(recipe.calo, 'Calories', 'Kcal'),
                                SizedBox(
                                  height: 16,
                                ),
                                buildNutrition(recipe.Total_Carbohydrate, 'Carbo', 'g'),
                                SizedBox(
                                  height: 16,
                                ),
                                buildNutrition(recipe.Protein, 'Protein', 'g'),
                              ],
                            ),
                            Positioned(
                                right: -80,
                                top: 10,
                                child: Hero(
                                    tag: recipe.urlImage,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[50],
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.35),
                                              spreadRadius: 7,
                                              blurRadius: 7,
                                              offset: Offset(0, 0))
                                        ],
                                      ),
                                      child: ClipOval(
                                          child: Image(
                                        image: AssetImage(recipe.urlImage),
                                        height: 300,
                                        width: 300,
                                        fit: BoxFit.cover,
                                      )),
                                    ))),
                          ],
                        ),
                      ),
                    ),
                    SliverPersistentHeader(
                      delegate: MyDelegate(
                        TabBar(
                          indicatorColor: AppColors.cor2,
                          unselectedLabelColor: Colors.grey,
                          labelColor: AppColors.cor2,
                          indicatorWeight: 2.0,
                          tabs: <Widget>[
                            Tab(
                                child:
                                    BasicText(text: "Ingredients", size: 17)),
                            Tab(
                                child:
                                    BasicText(text: "Instructions", size: 17)),
                            Tab(
                                child: BasicText(
                                    text: "Health Score", size: 16.5)),
                          ],
                        ),
                      ),
                      floating: true,
                      pinned: true,
                    )
                  ];
                },
                body: TabBarView(
                  children: [
                    Ingredients(),
                    Instructions(),
                    Health_Score(),
                  ],
                ))));
  }

  Widget Ingredients() {
    return ListView.builder(
        itemCount: recipe.ingredients.length,
        itemBuilder: (context, index) {
          // PrimaryText(text: 'Per ' + recipe.servings.toString());
          final ingredient = recipe.ingredients[index];
          return Text(ingredient.name);
        });
  }

  // return ListView(children: [
  //   Padding(
  //     padding: EdgeInsets.only(left: 16, right: 16, bottom: 80),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(recipe.ingrdients[0].name),
  //         Text(recipe.ingrdients[1].name),
  //         Text(recipe.ingrdients[2].name),
  //         Text(recipe.ingrdients[3].name),
  //         // Text(recipe.ingrdients[4].name),
  //         // Text(recipe.ingrdients[5].name),
  //         SizedBox(
  //           height: 16,
  //         ),
  //       ],
  //     ),
  //   )
  // ]);

  Widget Instructions() {
    return ListView.builder(
        itemCount: recipe.instructions.length,
        itemBuilder: (context, index) {
          // PrimaryText(text: 'Per ' + recipe.servings.toString());
          final step = recipe.instructions[index];
          return Text(step);
        });
  }

  Widget Health_Score() {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Recipe preparation'),
              Text("STEP 1"),
              Text(
                  "In a medium bowl, mix all the marinade ingredients with some seasoning. Chop the chicken into bite-sized pieces and toss with the marinade. Cover and chill in the fridge for 1 hr or overnight."),
              Text("STEP 2"),
              Text(
                  "In a large, heavy saucepan, heat the oil. Add the onion, garlic, green chilli, ginger and some seasoning. Fry on a medium heat for 10 mins or until soft."),
              Text("STEP 3"),
              Text(
                  "Add the spices with the tomato purée, cook for a further 2 mins until fragrant, then add the stock and marinated chicken. Cook for 15 mins, then add any remaining marinade left in the bowl. Simmer for 5 mins, then sprinkle with the toasted almonds. Serve with rice, naan bread, chutney, coriander and lime wedges, if you like."),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildNutrition(String value, String title, String subTitle) {
    return Container(
      height: 60,
      width: 150,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(0, 0))
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 0))
              ],
            ),
            child: Center(
              child: Text(
                value.toString(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subTitle,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyDelegate extends SliverPersistentHeaderDelegate {
  MyDelegate(this.tabBar);

  final TabBar tabBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 32,
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
