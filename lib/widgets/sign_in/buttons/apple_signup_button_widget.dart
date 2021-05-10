import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_dictionary/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class AppleSignupButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    width: 300,
    //padding: EdgeInsets.(4),
    decoration: new BoxDecoration(
        color: Colors.black,
        borderRadius: new BorderRadius.circular(50.0),
    ),
    child: OutlineButton.icon(
      label: Text(
        'Sign In With Apple       ',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      shape: StadiumBorder(),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      highlightedBorderColor: Colors.black,
      borderSide: BorderSide(color: Colors.black),
      textColor: Colors.white,
      icon: FaIcon(FontAwesomeIcons.apple, color: Colors.white),
      onPressed: () {
        final provider =
        Provider.of<GoogleSignInProvider>(context, listen: false);
        provider.login();
      },

    ),

  );
}