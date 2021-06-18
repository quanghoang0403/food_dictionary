import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_dictionary/widgets/colors.dart';
import 'package:food_dictionary/widgets/style.dart';
import 'package:food_dictionary/pages/search_ingredient_page.dart';
import 'package:food_dictionary/widgets/search_box.dart';
import 'package:food_dictionary/widgets/tempFood.dart';
import 'package:food_dictionary/model/recipe.dart';
import 'package:food_dictionary/model/ingredient.dart';
import 'package:food_dictionary/data/recipe_data.dart';
import 'package:food_dictionary/control_page.dart';


class DetailIngredient extends StatefulWidget {
  Ingredient ingredient;
  int lastPage;
  List<Recipe> relate_recipes;
  String query;

  DetailIngredient({@required this.ingredient, @required this.lastPage});

  @override
  _DetailIngredientState createState() =>
      _DetailIngredientState(ingredient: ingredient, lastPage: lastPage);
}

class _DetailIngredientState extends State<DetailIngredient> {
  Ingredient ingredient;
  int lastPage;
  List<Recipe> relate_recipes;

  _DetailIngredientState({@required this.ingredient, @required this.lastPage});

  @override
  void initState() {
    super.initState();
    String query = ingredient.name;
    searchRecipe(query);
    // Size size = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          toolbarHeight: 255,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 28,
                          margin: EdgeInsets.only(left: 20),
                          width: 30,
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
                      ],
                    ),
                    Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 5, left: 30, right: 30),
                        child: Text(ingredient.name,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: AppColors.cor2,
                            ))),
                    Container(
                      height: size.width * 0.45,
                      child: Image.asset(
                        ingredient.urlImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ]),
            )
          ]),
      body: Container(
          // padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 12),
                  blurRadius: 50,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ]),
          child: DefaultTabController(
              length: 3,
              child: NestedScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  headerSliverBuilder: (context, isScolled) {
                    return [
                      SliverPersistentHeader(
                        delegate: MyDelegate(
                          TabBar(
                            indicatorColor: AppColors.cor2,
                            unselectedLabelColor: Colors.grey,
                            labelColor: AppColors.cor2,
                            tabs: <Widget>[
                              Center(
                                  child: PrimaryText(
                                text: "Nutri Fact",
                                size: 20,
                                fontWeight: FontWeight.w500,
                              )),
                              Center(
                                  child: PrimaryText(
                                text: "Benifit",
                                size: 20,
                                fontWeight: FontWeight.w500,
                              )),
                              Center(
                                  child: PrimaryText(
                                text: "Recipes",
                                size: 20,
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
                      nutriFact(),
                      HealthBenifit(),
                      RelatedRecipe(),
                    ],
                  )))),
    );
  }

  Widget nutriFact() {
    return ListView(children: [
      Padding(
        padding: EdgeInsets.only(
          top: 15,
          left: 22,
        ),
        child: BasicText(
          text: 'Per: ' + ingredient.per,
          size: 19,
          fontWeight: FontWeight.w500,
        ),
      ),
      DataTable(
        columns: <DataColumn>[
          DataColumn(
              label: BasicText(
                  text: "Calories",
                  size: 17,
                  color: Colors.black.withOpacity(0.8))),
          DataColumn(
              label: BasicText(
                  text: ingredient.calo,
                  size: 17,
                  color: Colors.black.withOpacity(0.8))),
        ],
        rows: <DataRow>[
          DataRow(cells: <DataCell>[
            DataCell(BasicText(
                text: "Fat", size: 17, color: Colors.black.withOpacity(0.8))),
            DataCell(BasicText(
                text: ingredient.fat,
                size: 17,
                color: Colors.black.withOpacity(0.8)))
          ]),
          DataRow(cells: <DataCell>[
            DataCell(BasicText(
                text: "Sodium",
                size: 17,
                color: Colors.black.withOpacity(0.8))),
            DataCell(BasicText(
                text: ingredient.sodium,
                size: 17,
                color: Colors.black.withOpacity(0.8)))
          ]),
          DataRow(cells: <DataCell>[
            DataCell(BasicText(
                text: "Carbohydrate",
                size: 17,
                color: Colors.black.withOpacity(0.8))),
            DataCell(BasicText(
                text: ingredient.carbo,
                size: 17,
                color: Colors.black.withOpacity(0.8)))
          ]),
          DataRow(cells: <DataCell>[
            DataCell(BasicText(
                text: "Fiber", size: 17, color: Colors.black.withOpacity(0.8))),
            DataCell(BasicText(
                text: ingredient.fiber,
                size: 17,
                color: Colors.black.withOpacity(0.8)))
          ]),
          DataRow(cells: <DataCell>[
            DataCell(BasicText(
                text: "Sugars",
                size: 17,
                color: Colors.black.withOpacity(0.8))),
            DataCell(BasicText(
                text: ingredient.sugar,
                size: 17,
                color: Colors.black.withOpacity(0.8)))
          ])
        ],
      )
    ]);
  }

  Widget HealthBenifit() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
              child: Image(
            image: AssetImage("assets/images/search01/health_beni.png"),
            height: 160,
            width: 150,
            fit: BoxFit.cover,
          )),
          Container(
              height: 300,
              child: ListView.builder(
                  itemCount: ingredient.healthBenifit.length,
                  itemBuilder: (context, index) {
                    final beni = ingredient.healthBenifit[index];
                    return (BuildBenifit(beni));
                  }))
        ],
      ),
    );
  }

  Widget BuildBenifit(String beni) {
    return Container(
        padding: EdgeInsets.only(top: 10, left: 20),
        child: Row(
          children: [
            Icon(
              Icons.favorite,
              size: 25,
              color: AppColors.cor1,
            ),
            Padding(
                padding: EdgeInsets.only(left: 15),
                child: BasicText(
                    text: beni, color: Colors.black.withOpacity(0.8), size: 18))
          ],
        ));
  }

  Widget RelatedRecipe() {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, top: 10),
          child: PrimaryText(
            text: 'Related Recipes',
            color: AppColors.cor1,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
            child: Align(
          alignment: Alignment.centerRight,
          child: GridView.count(
              crossAxisCount: 2,
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(bottom: 10, left: 5, right: 20),
              shrinkWrap: true,
              primary: false,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              children: List.generate(relate_recipes.length, (index) {
                final item = relate_recipes[index];
                return TempRecipe(
                  recipe: item,
                  lastPage: 0,
                );
              })),
        )),
      ],
    );
  }

  void searchRecipe(String query) async {
    final relate_recipes = allRecipes.where((item) {
      final titleLower = item.name.toLowerCase();
      final searchLower = query.toLowerCase();
      return (titleLower.contains(searchLower));
    }).toList();

    setState(() {
      this.relate_recipes = relate_recipes;
    });
  }
}

class MyDelegate extends SliverPersistentHeaderDelegate {
  MyDelegate(this.tabBar);

  final TabBar tabBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      alignment: Alignment.center,
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
