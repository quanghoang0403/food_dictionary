import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_dictionary/control_page.dart';
import 'package:food_dictionary/widgets/sign_in/sign_up_widget.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:food_dictionary/pages/login_page.dart';
import 'package:page_transition/page_transition.dart';

class IntroPage extends StatelessWidget {
  final pageDecoration = PageDecoration(
    titleTextStyle:
    PageDecoration().titleTextStyle.copyWith(color: Colors.black),
    bodyTextStyle: PageDecoration().bodyTextStyle.copyWith(color: Colors.black),
    contentPadding: const EdgeInsets.all(10),
  );

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          image: new Stack(children: <Widget>[
            new Image.asset(
              "assets/images/intro/1.jpg",
              fit: BoxFit.cover,
              width: 400,
            ),
            new Positioned(
              top: 355,
              child: new Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                width: 400,
                height: 100,
              ),
            ),
          ]
          ),
          title: "EXPLORE THE INGREDIENTS OF FOOD",
          body: "With FooDiction, you can easily explore all knowledge about the food like image, origin, nutrition, the food can be cooked,...",
          //body: "This is an online ad. This is an online ad. This is an online ad. This is an online ad.",
          decoration: PageDecoration(
            titlePadding: EdgeInsets.only(top: 50.0, bottom: 20 ),
            contentPadding: EdgeInsets.only(top: 15.0),
            imageFlex: 23,
            bodyFlex: 16,
            boxDecoration: BoxDecoration(image: DecorationImage(image: new ExactAssetImage('assets/icons/foodiction-logo.png'),alignment: Alignment(0,0.245), scale: 12,
              )
            ),
            //boxDecoration: BoxDecoration(backgroundBlendMode: BlendMode.darken, color: Colors.orange),
            titleTextStyle: TextStyle(letterSpacing: 0.5, wordSpacing: 0.5, fontWeight: FontWeight.w700, fontSize: 20.0),
            bodyTextStyle: TextStyle(height: 1.5, fontSize: 18.7),
            //imagePadding: const EdgeInsets.only(bottom: 24.0),
          ),),
      PageViewModel(
        image: new Stack(children: <Widget>[
          new Image.asset(
            "assets/images/intro/2.jpg",
            fit: BoxFit.cover,
            width: 400,
          ),
          new Positioned(
            top: 355,
            child: new Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              width: 400,
              height: 100,
            ),
          ),
        ]
        ),
        title: "ALL THE RECIPES IN YOUR HAND",
        body: " FooDiction will help you make your                      own meal with almost all the recipes                     with details that you need.",
        //body: "This is an online ad. This is an online ad. This is an online ad. This is an online ad.",
        decoration: PageDecoration(
          titlePadding: EdgeInsets.only(top: 50.0, bottom: 20 ),
          contentPadding: EdgeInsets.only(top: 15.0),
          imageFlex: 23,
          bodyFlex: 16,
          boxDecoration: BoxDecoration(image: DecorationImage(image: new ExactAssetImage('assets/icons/foodiction-logo.png'),alignment: Alignment(0,0.245), scale: 12,
          )
          ),
          //boxDecoration: BoxDecoration(backgroundBlendMode: BlendMode.darken, color: Colors.orange),
          titleTextStyle: TextStyle(letterSpacing: 0.5, wordSpacing: 0.5, fontWeight: FontWeight.w700, fontSize: 20.0),
          bodyTextStyle: TextStyle(height: 1.5, fontSize: 18.7),
          //imagePadding: const EdgeInsets.only(bottom: 24.0),
        ),),
      PageViewModel(
        image: new Stack(children: <Widget>[
          new Image.asset(
            "assets/images/intro/3.jpg",
            fit: BoxFit.cover,
            width: 400,
          ),
          new Positioned(
            top: 355,
            child: new Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              width: 400,
              height: 100,
            ),
          ),
        ]
        ),
        title: "YOU DON'T KNOW WHAT TO COOK?",
        body: "FooDiction allows you to quickly search, find         & select exactly what you want to cook                   by your resources you are having.",
        //body: "This is an online ad. This is an online ad. This is an online ad. This is an online ad.",
        decoration: PageDecoration(
          titlePadding: EdgeInsets.only(top: 50.0, bottom: 20 ),
          contentPadding: EdgeInsets.only(top: 15.0),
          imageFlex: 23,
          bodyFlex: 16,
          boxDecoration: BoxDecoration(image: DecorationImage(image: new ExactAssetImage('assets/icons/foodiction-logo.png'),alignment: Alignment(0,0.245), scale: 12,
          )
          ),
          //boxDecoration: BoxDecoration(backgroundBlendMode: BlendMode.darken, color: Colors.orange),
          titleTextStyle: TextStyle(letterSpacing: 0.5, wordSpacing: 0.5, fontWeight: FontWeight.w700, fontSize: 20.0),
          bodyTextStyle: TextStyle(height: 1.5, fontSize: 18.7),
          //imagePadding: const EdgeInsets.only(bottom: 24.0),
        ),),
      PageViewModel(
        image: new Stack(children: <Widget>[
          new Image.asset(
            "assets/images/intro/4.jpg",
            fit: BoxFit.cover,
            width: 400,
          ),
          new Positioned(
            top: 355,
            child: new Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              width: 400,
              height: 100,
            ),
          ),
        ]
        ),
        title: "YOUR DEVICE - OUR FOODICTION",
        body: "Now, everything you want to know about             the food in your device, with our FooDiction.   Let's explore it now!",
        //body: "This is an online ad. This is an online ad. This is an online ad. This is an online ad.",
        decoration: PageDecoration(
          titlePadding: EdgeInsets.only(top: 50.0, bottom: 20 ),
          contentPadding: EdgeInsets.only(top: 15.0),
          imageFlex: 23,
          bodyFlex: 16,
          boxDecoration: BoxDecoration(image: DecorationImage(image: new ExactAssetImage('assets/icons/foodiction-logo.png'),alignment: Alignment(0,0.245), scale: 12,
          )
          ),
          //boxDecoration: BoxDecoration(backgroundBlendMode: BlendMode.darken, color: Colors.orange),
          titleTextStyle: TextStyle(letterSpacing: 0.5, wordSpacing: 0.5, fontWeight: FontWeight.w700, fontSize: 20.0),
          bodyTextStyle: TextStyle(height: 1.5, fontSize: 18.7),
          //imagePadding: const EdgeInsets.only(bottom: 24.0),
        ),),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        onDone: () {
          Navigator.push(
            context,
            PageTransition(duration: Duration(milliseconds: 300), type: PageTransitionType.rightToLeft, child: ControlPage(lastPage: 0,)),
          );
        },
        onSkip: () {
          Navigator.push(
            context,
            PageTransition(duration: Duration(milliseconds: 300), type: PageTransitionType.rightToLeft, child: ControlPage(lastPage: 0,)),
          );
        },
        globalBackgroundColor: Colors.white,
        pages: getPages(),
        dotsDecorator: DotsDecorator(
          size: Size.square(8.0),
          activeSize: Size(16.0, 8.0),
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0)
          ),
          color: Colors.grey,
          activeColor: Colors.orange.shade700,
          //shape:
        ),
        showSkipButton: true,
        showNextButton: true,
        skip: Text("Skip", style: TextStyle(color: Colors.orange.shade800, fontSize: 18)),
        next: Text("Next", style: TextStyle(color: Colors.orange.shade800, fontSize: 18)),
        done: Text(
          "Explore",
          style: TextStyle(color: Colors.orange.shade800, fontSize: 18),
        ),
      ),
    );
  }
}