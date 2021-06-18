import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_dictionary/control_page.dart';
import 'package:food_dictionary/data/recipe_data.dart';
import 'package:food_dictionary/model/ingredient.dart';
import 'package:food_dictionary/widgets/colors.dart';
import 'package:food_dictionary/widgets/style.dart';
import 'package:food_dictionary/pages/search_recipe_page.dart';
import 'package:food_dictionary/widgets/search_box.dart';
import 'package:food_dictionary/widgets/tempFood.dart';
import 'package:food_dictionary/model/recipe.dart';

class DetailRecipe extends StatefulWidget {
  final Recipe recipe;
  int lastPage;

  @override
  DetailRecipe({@required this.recipe, @required this.lastPage});

  @override
  _DetailRecipeState createState() =>
      _DetailRecipeState(recipe: recipe, lastPage: lastPage);
}

class _DetailRecipeState extends State<DetailRecipe> {
  final Recipe recipe;
  int lastPage;
  int new_serving;
  IconData icon_favo;
  int flat = 1;
  @override
  _DetailRecipeState({@required this.recipe, @required this.lastPage});

  @override
  void initState() {
    super.initState();
    new_serving = recipe.servings;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    flat = this.recipe.favo_state % 2;
    if (flat == 1) {
      this.icon_favo = Icons.favorite_border_outlined;
    } else this.icon_favo = Icons.favorite;
    // var count = recipe.ingrdients.length();
    return Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
            toolbarHeight: 60,
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              Expanded(
                  child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
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
                    Center(
                        // width: 260,
                        // alignment: Alignment.center,
                        // padding: EdgeInsets.only(top: 5),
                        child: Text(recipe.name,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: AppColors.cor2,
                            ))),
                    IconButton(
                      icon: Icon(
                        icon_favo,
                        size: 28,
                        color: AppColors.cor2,
                      ),
                      onPressed: () {
                        setState(() {
                          this.recipe.favo_state = this.recipe.favo_state + 1;
                          print(this.recipe.favo_state);
                        });
                      },
                    ),
                  ],
                ),
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
                                buildNutrition(
                                    recipe.Total_Carbohydrate, 'Carbo', 'g'),
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
                                        height: 291,
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
                          tabs: <Widget>[
                            Center(
                                child: PrimaryText(
                              text: "Ingredient",
                              size: 19,
                              fontWeight: FontWeight.w500,
                            )),
                            Center(
                                child: PrimaryText(
                              text: "Instruction",
                              size: 19,
                              fontWeight: FontWeight.w500,
                            )),
                            Center(
                                child: PrimaryText(
                              text: "Nutrition",
                              size: 19,
                              fontWeight: FontWeight.w500,
                            )),
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
    return SingleChildScrollView(
        child: Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          height: 30,
          alignment: Alignment.centerLeft,
          child: FloatingActionButton(
              elevation: 2,
              focusColor: AppColors.cor1,
              backgroundColor: Colors.white,
              onPressed: () {
                setState(() {
                  if (new_serving > 1) {
                    this.new_serving = this.new_serving - 1;
                  }
                  ;
                });
              },
              child: Icon(
                Icons.remove,
                size: 23,
                color: AppColors.cor1,
              )),
        ),
        Container(
            alignment: Alignment.center,
            height: 32,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.cor1.withOpacity(0.75),
            ),
            child: PrimaryText(
              text: "Servings: " + new_serving.toString(),
              size: 19,
              color: Colors.white,
            )),
        Container(
          height: 30,
          alignment: Alignment.centerLeft,
          child: FloatingActionButton(
              elevation: 2,
              focusColor: AppColors.cor1,
              backgroundColor: Colors.white,
              onPressed: () {
                setState(() {
                  this.new_serving = this.new_serving + 1;
                });
              },
              child: Icon(
                Icons.add,
                size: 23,
                color: AppColors.cor1,
              )),
        )
      ]),
      SizedBox(height: 15),
      Row(children: [
        Container(
          child: Padding(
              padding: EdgeInsets.only(left: 40),
              child: BasicText(
                text: "Ingredient",
                color: AppColors.cor1,
                size: 19,
                fontWeight: FontWeight.w500,
              )),
        ),
        Container(
          child: Padding(
              padding: EdgeInsets.only(left: 160),
              child: BasicText(
                text: "Count",
                color: AppColors.cor1,
                size: 19,
                fontWeight: FontWeight.w500,
              )),
        ),
      ]),
      SizedBox(height: 10),
      Container(
        height: 170,
        child: Ingredient_Unit(),
      )
    ]));
  }

  Widget Ingredient_Unit() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: recipe.ingredients.length,
        itemBuilder: (context, index) {
          // PrimaryText(text: 'Per ' + recipe.servings.toString());
          final ingredient = recipe.ingredients[index];
          final count =
              recipe.countIngre[index] * new_serving / recipe.servings;
          return Column(
            children: [
              Row(
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 40),
                      child: Image(
                        height: 35,
                        image: AssetImage(ingredient.urlImage),
                        fit: BoxFit.cover,
                      )),
                  Container(
                    width: 120,
                    child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: BasicText(
                            text: ingredient.name,
                            color: Colors.black.withOpacity(0.8),
                            size: 18)),
                  ),
                  Container(
                    width: 180,
                    child: Padding(
                        padding: EdgeInsets.only(left: 120),
                        child: BasicText(
                            text: count.toString(),
                            color: Colors.black.withOpacity(0.8),
                            size: 18)),
                  )
                ],
              )
            ],
          );
        });
  }

  Widget Instructions() {
    return SingleChildScrollView(
        padding: EdgeInsets.only(top: 0, left: 0),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
                alignment: Alignment.center,
                height: 32,
                width: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.cor1.withOpacity(0.75),
                ),
                child: PrimaryText(
                  text: "Cooking time: " + recipe.time.toString() + " min",
                  size: 19,
                  color: Colors.white,
                ))
          ]),
          Container(
            height: 550,
            child: Step(),
          )
        ]));
  }

  Widget Step() {
    return ListView.builder(
        itemCount: recipe.instructions.length,
        itemBuilder: (context, index) {
          final step = recipe.instructions[index];
          return Padding(
              padding: EdgeInsets.only(left: 20, right: 16, bottom: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row(children: [
                    //   Icon(
                    //     Icons.health_and_safety_rounded,
                    //     size: 25,
                    //     color: AppColors.cor1,
                    //   ),
                    BasicText(text: "Step " + (index + 1).toString(), size: 18),
                    Text(step,
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8), fontSize: 16))
                  ]));
        });
  }

  Widget Health_Score() {
    return ListView(children: [
      Padding(
        padding: EdgeInsets.only(
          left: 0,
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Container(
              alignment: Alignment.center,
              height: 32,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.cor1.withOpacity(0.75),
              ),
              child: PrimaryText(
                text: "Per: 1 serving",
                size: 19,
                color: Colors.white,
              ))
        ]),
      ),
      DataTable(
        horizontalMargin: 50,
        columnSpacing: 130,
        columns: <DataColumn>[
          DataColumn(
              label: BasicText(
                  text: "Calories",
                  size: 17,
                  color: Colors.black.withOpacity(0.8))),
          DataColumn(
              label: BasicText(
                  text: recipe.calo,
                  size: 17,
                  color: Colors.black.withOpacity(0.8))),
        ],
        rows: <DataRow>[
          DataRow(cells: <DataCell>[
            DataCell(BasicText(
                text: "Total Fat",
                size: 17,
                color: Colors.black.withOpacity(0.8))),
            DataCell(BasicText(
                text: recipe.Total_Fat,
                size: 17,
                color: Colors.black.withOpacity(0.8)))
          ]),
          DataRow(cells: <DataCell>[
            DataCell(BasicText(
                text: "Saturated Fat",
                size: 17,
                color: Colors.black.withOpacity(0.8))),
            DataCell(BasicText(
                text: recipe.Saturated_Fat,
                size: 17,
                color: Colors.black.withOpacity(0.8)))
          ]),
          DataRow(cells: <DataCell>[
            DataCell(BasicText(
                text: "Cholesterol",
                size: 17,
                color: Colors.black.withOpacity(0.8))),
            DataCell(BasicText(
                text: recipe.Sodium,
                size: 17,
                color: Colors.black.withOpacity(0.8)))
          ]),
          DataRow(cells: <DataCell>[
            DataCell(BasicText(
                text: "Sodium",
                size: 17,
                color: Colors.black.withOpacity(0.8))),
            DataCell(BasicText(
                text: recipe.Sodium,
                size: 17,
                color: Colors.black.withOpacity(0.8)))
          ]),
          DataRow(cells: <DataCell>[
            DataCell(BasicText(
                text: "Total Carbohydrate",
                size: 17,
                color: Colors.black.withOpacity(0.8))),
            DataCell(BasicText(
                text: recipe.Total_Carbohydrate,
                size: 17,
                color: Colors.black.withOpacity(0.8)))
          ]),
          DataRow(cells: <DataCell>[
            DataCell(BasicText(
                text: "Dietary Fiber",
                size: 17,
                color: Colors.black.withOpacity(0.8))),
            DataCell(BasicText(
                text: recipe.Dietary_Fiber,
                size: 17,
                color: Colors.black.withOpacity(0.8)))
          ]),
          DataRow(cells: <DataCell>[
            DataCell(BasicText(
                text: "Total Sugars",
                size: 17,
                color: Colors.black.withOpacity(0.8))),
            DataCell(BasicText(
                text: recipe.Total_Sugars,
                size: 17,
                color: Colors.black.withOpacity(0.8)))
          ]),
          DataRow(cells: <DataCell>[
            DataCell(BasicText(
                text: "Protein",
                size: 17,
                color: Colors.black.withOpacity(0.8))),
            DataCell(BasicText(
                text: recipe.Protein,
                size: 17,
                color: Colors.black.withOpacity(0.8)))
          ]),
          DataRow(cells: <DataCell>[
            DataCell(BasicText(
                text: "Vitamin D",
                size: 17,
                color: Colors.black.withOpacity(0.8))),
            DataCell(BasicText(
                text: recipe.Vitamin_D,
                size: 17,
                color: Colors.black.withOpacity(0.8)))
          ]),
          DataRow(cells: <DataCell>[
            DataCell(BasicText(
                text: "Calcium",
                size: 17,
                color: Colors.black.withOpacity(0.8))),
            DataCell(BasicText(
                text: recipe.Calcium,
                size: 17,
                color: Colors.black.withOpacity(0.8)))
          ]),
          DataRow(cells: <DataCell>[
            DataCell(BasicText(
                text: "Iron", size: 17, color: Colors.black.withOpacity(0.8))),
            DataCell(BasicText(
                text: recipe.Iron,
                size: 17,
                color: Colors.black.withOpacity(0.8)))
          ]),
          DataRow(cells: <DataCell>[
            DataCell(BasicText(
                text: "Potassium",
                size: 17,
                color: Colors.black.withOpacity(0.8))),
            DataCell(BasicText(
                text: recipe.Potassium,
                size: 17,
                color: Colors.black.withOpacity(0.8)))
          ]),
        ],
      )
    ]);
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
