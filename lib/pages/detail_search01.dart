import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_dictionary/widgets/colors.dart';
import 'package:food_dictionary/widgets/style.dart';
import 'package:food_dictionary/pages/search01_page.dart';
import 'package:food_dictionary/pages/search_page.dart';
import 'package:food_dictionary/widgets/search_box.dart';
import 'package:food_dictionary/widgets/tempFood.dart';
import 'package:food_dictionary/widgets/textTemPlate.dart';
import 'package:food_dictionary/model/ingredient.dart';

class DetailIngredient extends StatefulWidget {
  Ingredient ingredient;

  DetailIngredient({@required this.ingredient});

  @override
  _DetailIngredientState createState() =>
      _DetailIngredientState(ingredient: ingredient);
}

class _DetailIngredientState extends State<DetailIngredient> {
  Ingredient ingredient;

  _DetailIngredientState({@required this.ingredient});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print('hi');
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
                              builder: (context) => SearchPage(
                                selected_Tab: 0,
                              )));
                    },
                  ),
                  Container(
                      width: 270,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: 5),
                      child: Text(ingredient.name,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: AppColors.cor2,
                          ))),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Icon(
                      Icons.favorite_border,
                      color: AppColors.cor2,
                      size: 28,
                    ),
                  )
                ],
              ),
                  Container(
                    height: size.width * 0.5,
                    child: Image.asset(
                      ingredient.urlImage,
                      fit: BoxFit.cover,
                    ),
                  ),
            ]),
            )
          ]),
      body: Container(
          // padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 12),
                  blurRadius: 50,
                  color: AppColors.cor2.withOpacity(0.5),
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
                        indicatorWeight: 2.0,
                        tabs: <Widget>[
                          Tab(child: BasicText(text: "Nutri Fact", size: 17)),
                          Tab(
                              child:
                                  BasicText(text: "Health Benifit", size: 17)),
                          Tab(
                              child:
                                  BasicText(text: "Related Recipes", size: 17)),
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
        padding: EdgeInsets.only(top: 5, left: 24),
        child: BasicText(text: 'Per: ' + ingredient.per, size: 16),
      ),
      DataTable(
        columns: <DataColumn>[
          DataColumn(label: BasicText(text: "Calories", size: 16)),
          DataColumn(label: BasicText(text: ingredient.calo, size: 16)),
        ],
        rows: <DataRow>[
          DataRow(cells: <DataCell>[
            DataCell(BasicText(text: "Fat", size: 16)),
            DataCell(BasicText(text: ingredient.fat, size: 16))
          ]),
          DataRow(cells: <DataCell>[
            DataCell(BasicText(text: "Sodium", size: 16)),
            DataCell(BasicText(text: ingredient.sodium, size: 16))
          ]),
          DataRow(cells: <DataCell>[
            DataCell(BasicText(text: "Carbohydrate", size: 16)),
            DataCell(BasicText(text: ingredient.carbo, size: 16))
          ]),
          DataRow(cells: <DataCell>[
            DataCell(BasicText(text: "Fiber", size: 16)),
            DataCell(BasicText(text: ingredient.fiber, size: 16))
          ]),
          DataRow(cells: <DataCell>[
            DataCell(BasicText(text: "Sugars", size: 16)),
            DataCell(BasicText(text: ingredient.sugar, size: 16))
          ])
        ],
      )
    ]);
  }

  Widget HealthBenifit() {
    return ListView.builder(
        itemCount: 0,
        itemBuilder: (context, index) {
          final beni = ingredient.healthBenifit[index];
          return (Text(beni));
        });
  }

  Widget RelatedRecipe() {
    return ListView(
      children: [
        PrimaryText(text: 'Related Recipes'),
      ],
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
