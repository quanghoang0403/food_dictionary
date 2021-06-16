//import 'dart:html';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_dictionary/pages/home_page.dart';
import 'package:food_dictionary/pages/search_ingredient_page.dart';
import 'package:food_dictionary/pages/search_recipe_page.dart';
import 'package:food_dictionary/pages/cook_now_page.dart';
import 'package:food_dictionary/pages/person_page.dart';
import 'package:food_dictionary/widgets/colors.dart';

class ControlPage extends StatefulWidget {
  int lastPage = 0;
  ControlPage({@required this.lastPage});
  @override
  _PageState createState() => _PageState(lastPage: lastPage);
}

class _PageState extends State<ControlPage> {
  final int lastPage;
  final PageStorageBucket bucket = PageStorageBucket();
  final user = FirebaseAuth.instance.currentUser;
  Widget currentScreen;
  _PageState({@required this.lastPage});

  @override
  void initState() {
    super.initState();
    getPage(lastPage);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: lastPage,
        height: 48,
        color: AppColors.cor2,
        backgroundColor: Colors.white.withOpacity(0),
        buttonBackgroundColor: AppColors.cor2,
        // animationDuration: Duration(
        //   microseconds: 500,
        // ),
        // animationCurve: Curves.bounceInOut,
        items: [
          Icon(Icons.visibility_outlined, size: 28, color: Colors.white),
          Icon(Icons.set_meal, size: 28, color: Colors.white),
          Icon(Icons.room_service, size: 28, color: Colors.white),
          Icon(Icons.restaurant_menu, size: 28, color: Colors.white),
          Icon(Icons.person, size: 28, color: Colors.white),
        ],
        onTap: (index) {
          index == 0
              ? setState(() {
                  currentScreen = HomePage();
            lastPage == 0;
                })
              : index == 1
                  ? setState(() {
                      currentScreen = Search01();
                      lastPage == 1;
                    })
                  : index == 2
                      ? setState(() {
                          currentScreen = Search02();
                          lastPage == 2;
                        })
                      : index == 3
                          ? setState(() {
                              currentScreen = Create();
                              lastPage == 3;
                            })
                          : index == 4
                              ? setState(() {
                                  currentScreen = Person();
                                  lastPage == 4;
                                })
                              : setState(() {
                                  currentScreen = HomePage();
                                  lastPage == 0;
                                });
          //Handle button tap
        },
      ),
    );
  }

  void getPage (int lastPage) {
    lastPage == 0
        ? setState(() {
      currentScreen = HomePage();

    }):
    lastPage == 1
        ? setState(() {
      currentScreen = Search01();
    })
        : lastPage == 2
        ? setState(() {
      currentScreen = Search02();
    })
        : lastPage == 3
        ? setState(() {
      currentScreen = Create();
    })
        : lastPage == 4
        ? setState(() {
      currentScreen = Person();
    })
        : setState(() {
      currentScreen = HomePage();
    });
    //Handle button tap
  }
}
