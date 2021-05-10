//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:food_dictionary/pages/home_page.dart';
import 'package:food_dictionary/pages/search01_page.dart';
import 'package:food_dictionary/pages/search02_page.dart';
import 'package:food_dictionary/pages/search03_page.dart';
import 'package:food_dictionary/widgets/colors.dart';
import 'package:food_dictionary/widgets/style.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return MaterialApp(
    home: ControlTab());
  }
}

class ControlTab extends StatelessWidget {
  @override 
  Widget build(BuildContext context){
return DefaultTabController(
  length: 3,
  child:   Scaffold( 
  appBar: AppBar(
    toolbarHeight: 60,
    elevation: 0,
    backgroundColor: Colors.white,
        bottom: TabBar(
        indicatorColor: AppColors.cor2,
        unselectedLabelColor: Colors.grey,
        labelColor: AppColors.cor2 ,
        indicatorWeight: 3.0,
          tabs: <Widget>[
            Tab(
              child: BasicText(text: "Ingredient")
              ),
            Tab(
              child: BasicText(text: "Recipes")
              ),
            Tab(
              child: BasicText(text: "From you")
              ),
  
          ],
        ),
  ),
  body: TabBarView(
children: [
  Search01(),
  Search02(),
  Search03(),
],
  )
  ),
);
  }
}