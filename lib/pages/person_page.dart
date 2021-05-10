import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:foodiction1/widgets/colors.dart';
import 'package:food_dictionary/widgets/style.dart';
//import 'package:foodiction1/widgets/body.dart';
//import 'package:foodiction1/widgets/tempFood.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class Person extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: PrimaryText(text: "This is person page")
      )
    );
  }
}
