import 'package:flutter/material.dart';
import 'package:food_dictionary/widgets/sign_in/background_painter.dart';
import 'package:food_dictionary/widgets/sign_in/buttons/google_signup_button_widget.dart';
import 'package:food_dictionary/widgets/sign_in/buttons/fb_signup_button_widget.dart';
import 'package:food_dictionary/widgets/sign_in/buttons/apple_signup_button_widget.dart';
//import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Stack(
        fit: StackFit.expand,
        children: [
          //CustomPaint(painter: BackgroundPainter()),
          buildSignUp(),
        ],
      );

  Widget buildSignUp() => Column(
        children: [
          Spacer(),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Welcome to FooDiction',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Image.asset('assets/icons/foodiction-logo.png', width: 250),
          SizedBox(height: 20),
          FacebookSignupButtonWidget(),
          SizedBox(height: 10),
          GoogleSignupButtonWidget(),
          SizedBox(height: 10),
          AppleSignupButtonWidget(),
          SizedBox(height: 25),
          Align(
            child: Container(
              child: Text(
                'Login to continue',
                style: TextStyle(
                  letterSpacing: 1,
                  //color: Colors.white,
                  color: Colors.orange.shade700,
                  fontSize: 18.6,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 70),
        ],
      );
}