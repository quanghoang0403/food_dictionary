import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_dictionary/model/ingredient.dart';
import 'package:food_dictionary/pages/detail_ingredient_page.dart';
import 'package:food_dictionary/widgets/colors.dart';
import 'package:food_dictionary/widgets/style.dart';
import 'package:food_dictionary/widgets/search_box.dart';
import 'package:food_dictionary/widgets/tempFood.dart';
import 'package:food_dictionary/pages/show_more_page.dart';

//import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_dictionary/data/ingredient_data.dart';

class Search01 extends StatefulWidget {
  @override
  Search01State createState() => Search01State();
}

class Search01State extends State<Search01> {
  List<Ingredient> ingredients = allIngredietnts;
  String query = '';

  @override
  void initState() {
    super.initState();
    searchIngredient(query);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
          body: ListView(children: [
        SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Container(
                height: 120,
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                        bottom: 36,
                      ),
                      height: 70,
                      decoration: BoxDecoration(
                        color: AppColors.cor2,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 140,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          PrimaryText(
                            text: 'Ingredient',
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            size: 23,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 0,
                      right: 0,
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: SearchWidget(
                                text: query,
                                hintText: "Search ingredient",
                                onChanged: searchIngredient,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              GestureDetector(
                onTap: () {},
                child: Padding(
                    padding: EdgeInsets.only(left: 25, top: 5),
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
                        ))),
              ),
              SizedBox(
                height: 20,
              ),
              buildCategoryWidget(),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.all(3),
                  // height: 150,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GridView.count(
                        crossAxisCount: 2,
                        scrollDirection: Axis.vertical,
                        padding:
                            EdgeInsets.only(bottom: 10, left: 10, right: 25),
                        shrinkWrap: true,
                        primary: false,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 1.15,
                        children: List.generate(ingredients.length, (index) {
                            final item = ingredients[index];
                            return TempIngredient(
                              ingredient: item,
                              lastPage: 1,
                            );
                        })),
                  )),
              // buildProductWidget(context),
            ]))
      ]));
  List category = [
    {
      'icon': "assets/images/search01/category/milk.png",
      'name': 'Egg, Milk',
      'color': Color(0xffA4DEF1),
      'list': allIngredietnts.where((item) {
        final cate = item.cate;
        return (cate == 'Egg, Milk');
      }).toList(),
    },
    {
      'icon': "assets/images/search01/category/fruit.png",
      'name': 'Fruit',
      'color': Color(0xff82D07B),
      'list': allIngredietnts.where((item) {
        final cate = item.cate;
        return (cate == 'Fruit');
      }).toList(),
    },
    {
      'icon': "assets/images/search01/category/veg.png",
      'name': 'Veg',
      'color': Color(0xffF5CC22),
      'list': allIngredietnts.where((item) {
        final cate = item.cate;
        return (cate == 'Veg');
      }).toList(),
    },
    {
      'icon': "assets/images/search01/category/meat.png",
      'name': 'Meat, Fish',
      'color': Color(0xffFCA393),
      'list': allIngredietnts.where((item) {
        final cate = item.cate;
        return (cate == 'Meat, Fish');
      }).toList(),
    },
    {
      'icon': "assets/images/search01/category/herb.png",
      'name': 'Herb, Spice',
      'color': Color(0xffFEEE5E),
      'list': allIngredietnts.where((item) {
        final cate = item.cate;
        return (cate == 'Herb, Spice');
      }).toList(),
    },
    {
      'icon': "assets/images/search01/category/grain.png",
      'name': 'Grain, Nut',
      'color': Color(0xffFFBE58),
      'list': allIngredietnts.where((item) {
        final cate = item.cate;
        return (cate == 'Grain, Nut');
      }).toList(),
    },
    {
      'icon': "assets/images/search01/category/oil.png",
      'name': 'Fat, Oil',
      'color': Color(0xff83f8a4),
      'list': allIngredietnts.where((item) {
        final cate = item.cate;
        return (cate == 'Fat, Oil');
      }).toList(),
    },
    {
      'icon': "assets/images/search01/category/pasta.png",
      'name': 'Pasta',
      'color': Color(0xffeed80e),
      'list': allIngredietnts.where((item) {
        final cate = item.cate;
        return (cate == 'Egg, Milk');
      }).toList(),
    },
    {
      'icon': "assets/images/search01/category/other.png",
      'name': 'Others',
      'color': Color(0xffa1c8f6),
      'list': allIngredietnts.where((item) {
        final cate = item.cate;
        return (cate == 'Others');
      }).toList(),
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
              child: GestureDetector(
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.all(5),
                        height: 75,
                        width: 80,
                        decoration: BoxDecoration(
                            color: item['color'],
                            borderRadius: BorderRadius.circular(12)),
                        child: Image.asset(
                          item['icon'],
                          color: Colors.white,
                        )),
                    BasicText(text: (item['name']), size: 15.5)
                  ],
                ),
                  onTap: (                    ){Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ShowCate(list: item['list'], lastPage: 1,  name: item['name'])));}
              )
            );
          },
        ),
    );
  }

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
