import 'package:flutter/material.dart';
import 'package:food_dictionary/control_page.dart';
//import 'package:food_dictionary/control_page.dart';
import 'package:food_dictionary/pages/intro_page.dart';
import 'package:food_dictionary/provider/google_sign_in.dart';
import 'package:food_dictionary/widgets/sign_in/logged_in_widget.dart';
import 'package:food_dictionary/widgets/sign_in/sign_up_widget.dart';
import 'package:food_dictionary/widgets/style.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_dictionary/widgets/sign_in/background_painter.dart';
import 'package:food_dictionary/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              final provider = Provider.of<GoogleSignInProvider>(context);

              if (provider.isSigningIn) {
                return buildLoading();
              } else if (snapshot.hasData) {
                return ControlPage(lastPage: 0,);
              } else {
                return SignUpWidget();
              }
            },
          ),
        ),
      );

  Widget buildLoading() => Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(painter: BackgroundPainter()),
          Center(child: CircularProgressIndicator()),
          PrimaryText(text: "Don't worry, keep calm and smile", size: 20),
        ],
      );
}