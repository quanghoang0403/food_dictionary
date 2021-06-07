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
  _DetailIngredientState createState() => _DetailIngredientState(ingredient: ingredient);
}

class _DetailIngredientState extends State<DetailIngredient> {
  Ingredient ingredient;
  _DetailIngredientState({@required this.ingredient});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 25, color: AppColors.cor2,),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SearchPage(selected_Tab: 0,)));
          },
        ),
      ),
      body: ListView(
        children: [
          Container(
              child: Column(
            children: [
              Container(
                height: size.width * 0.5,
                child: Image.asset(
                  ingredient.urlImage,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 12),
                    blurRadius: 30,
                    color: AppColors.cor2.withOpacity(0.8),
                  ),
                ]),
            child: Column(children: [
              Text(ingredient.name,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: AppColors.cor2,
                  )),
              // BasicText(
              //     text:
              //         'The old adage, "an apple a day keeps the doctor away" has yet to be proven wrong.',
              //     size: 16),
              Container(
                // width: 700,
                // color: Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 5, left: 24),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text("Nutri Fact",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.cor1)),
                                BasicText(
                                    text: 'Per: ' + ingredient.per,
                                    size: 16),
                              ])),
                      DataTable(
                        columns: <DataColumn>[
                          DataColumn(
                              label: BasicText(text: "Calories", size: 16)),
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
                    ]),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
