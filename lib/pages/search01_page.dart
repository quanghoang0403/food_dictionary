import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_dictionary/widgets/colors.dart';
import 'package:food_dictionary/widgets/style.dart';
import 'package:food_dictionary/widgets/search_box.dart';
//import 'package:food_dictionary/widgets/body.dart';
//import 'package:food_dictionary/widgets/tempFood.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class Search01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
          SearchBox(onChanged: (value){},)
      ],);
  }
}

