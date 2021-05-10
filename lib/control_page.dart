//import 'dart:html';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_dictionary/pages/home_page.dart';
import 'package:food_dictionary/pages/search_page.dart';
import 'package:food_dictionary/pages/person_page.dart';
import 'package:food_dictionary/widgets/colors.dart';
class ControlPage extends StatefulWidget {
  @override 
  _PageState createState()=> _PageState();
}

class _PageState extends State<ControlPage>{
  int currentTab = 0;
final PageStorageBucket bucket = PageStorageBucket();
final user = FirebaseAuth.instance.currentUser;
Widget currentScreen = HomePage();

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,),
    //floatingActionButton: FloatingActionButton(
      //child: Icon(Icons.add),
      //onPressed: (){},), 
    //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,   
    bottomNavigationBar: BottomAppBar(
      child: Container(
        height: 50,
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              minWidth: 80,
              onPressed: (){
                setState((){
                  currentScreen = HomePage();
                  currentTab = 0;
                });
              },
              child: Icon(
                Icons.home,
                color: currentTab == 0 ? AppColors.cor2 : AppColors.lightGray,
                size: 30)
            ),
            MaterialButton(
              minWidth: 30,
              onPressed: (){
                setState((){
                  currentScreen = SearchPage();
                  currentTab = 1;
                });
              },
              child: Icon(
                Icons.search,
                color: currentTab == 1 ? AppColors.cor2 : AppColors.lightGray,
                size: 30)
            ),
            MaterialButton(
              minWidth: 40,
              onPressed: (){
                setState((){
                  currentScreen = Person();
                  currentTab = 2;
                });
              },
              child: Icon(

                Icons.person,
                color: currentTab == 2 ? AppColors.cor2 : AppColors.lightGray,
                size: 30)
            )
          ],
        ),
        ),
      ),
    );
  }
}