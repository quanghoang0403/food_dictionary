//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:food_dictionary/pages/home_page.dart';
import 'package:food_dictionary/pages/search01_page.dart';
import 'package:food_dictionary/pages/search02_page.dart';
import 'package:food_dictionary/pages/search03_page.dart';
import 'package:food_dictionary/widgets/colors.dart';
import 'package:food_dictionary/widgets/style.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({
    Key key,
    @required this.selected_Tab,
  }) :  assert(selected_Tab != null),
        super(key: key);
  final int selected_Tab;
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    int index = selected_Tab;
    return MaterialApp(
    home: ControlTab(index_Tab: index,));
  }
}

class ControlTab extends StatelessWidget {
  const ControlTab({
    Key key,
  @required this.index_Tab,
  }) :super(key: key);
  final int index_Tab;
  @override 
  Widget build(BuildContext context){

return DefaultTabController(
  length: 3,
  initialIndex: index_Tab,
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
  Create(),
],
  )
  ),
);
  }
}