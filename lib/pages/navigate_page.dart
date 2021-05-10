import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_dictionary/control_page.dart';
import 'package:food_dictionary/pages/intro_page.dart';
import 'package:food_dictionary/pages/login_page.dart';
import 'package:food_dictionary/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class NavigatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              final provider = Provider.of<GoogleSignInProvider>(context);

              if (snapshot.hasData) {
                return ControlPage();
              } else {
                return IntroPage();
              }
            },
          ),
        ),
      );
}