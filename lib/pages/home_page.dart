import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_dictionary/provider/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:food_dictionary/widgets/colors.dart';
import 'package:food_dictionary/widgets/style.dart';
import 'package:food_dictionary/widgets/textTemPlate.dart';
import 'package:food_dictionary/widgets/tempFood.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(height: 20),
          SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(width: 20),
                  CircleAvatar(
                    maxRadius: 25,
                    backgroundImage: NetworkImage(user.photoURL),
                  ),
                  SizedBox(width: 20),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      PrimaryText(
                        text: 'Hello ' + user.displayName,
                        size: 23,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(width: 20),
                      PrimaryText(text: 'What do you want to eat?', size: 20)
                    ]
                  )
                ],
              ),
              TextForPromoButon(
                title: 'Trending Recipes',
                press: () {},
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      TempFood(
                          size: size,
                          image: "assets/images/home/img01.png",
                          title: "Meal 01",
                          press: () {}),
                      TempFood(
                          size: size,
                          image: "assets/images/home/img02.png",
                          title: "Meal 02",
                          press: () {}),
                      TempFood(
                          size: size,
                          image: "assets/images/home/img03.png",
                          title: "Meal 03",
                          press: () {}),
                      TempFood(
                          size: size,
                          image: "assets/images/home/img04.png",
                          title: "Meal 04",
                          press: () {}),
                      TempFood(
                          size: size,
                          image: "assets/images/home/img05.jpg",
                          title: "Meal 05",
                          press: () {}),
                      TempFood(
                          size: size,
                          image: "assets/images/home/img05.png",
                          title: "Meal 06",
                          press: () {}),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: TextForPromoButon(
                  title: 'Happy Mother Day',
                  press: () {},
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: <Widget>[
                  TempFood(
                      size: size * 1.15,
                      image: "assets/images/home/cake1.jpg",
                      title: "Cake 01",
                      press: () {}),
                  TempFood(
                      size: size * 1.15,
                      image: "assets/images/home/cake2.jpg",
                      title: "Cake 02",
                      press: () {}),
                  TempFood(
                      size: size * 1.15,
                      image: "assets/images/home/cake3.png",
                      title: "Cake 03",
                      press: () {}),
                  TempFood(
                      size: size * 1.15,
                      image: "assets/images/home/cake4.jpg",
                      title: "Cake 04",
                      press: () {}),
                  TempFood(
                      size: size * 1.15,
                      image: "assets/images/home/cake5.jpg",
                      title: "Cake 05",
                      press: () {}),
                  TempFood(
                      size: size * 1.15,
                      image: "assets/images/home/cake6.jpg",
                      title: "Cake 06",
                      press: () {}),
                  TempFood(
                      size: size * 1.15,
                      image: "assets/images/home/cake7.jpg",
                      title: "Cake 07",
                      press: () {}),
                ]),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
