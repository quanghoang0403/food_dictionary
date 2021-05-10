import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:food_dictionary/pages/intro_page.dart';
import 'package:food_dictionary/pages/login_page.dart';
import 'package:food_dictionary/pages/navigate_page.dart';
import 'package:page_transition/page_transition.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => new _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    //Navigator.of(context).pushReplacementNamed('/HomeScreen');
    Navigator.push(context,
      PageTransition(duration: Duration(milliseconds: 1000),
          type: PageTransitionType.rotate,
          child: NavigatePage()));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Container(
          width: 450,
          //color: Color(0xffFA4A0C),
          color: Color(0xffF8931F),
          child: new Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 100),
              new Image.asset(
                'assets/icons/foodiction-logo.png',
                width: 300,
                height: 300,
              ),
              SizedBox(height: 70),
              Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                  child: new Image.asset(
                    'assets/icons/brand-logo.png',
                    width: 200,
                    height: 200,
                ),
              ),
              SizedBox(height: 16),
              AnimatedDefaultTextStyle(
                child: Text('Explore the value of food'),
                style: TextStyle(
                  fontFamily: 'Bauhaus 93',
                  color: Colors.white,
                  fontSize: 28,
                ) ,
                duration: Duration(milliseconds: 200),
              ),
              // new Container(
              //   padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
              //   child: new CircularProgressIndicator(
              //     backgroundColor: Colors.black,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}