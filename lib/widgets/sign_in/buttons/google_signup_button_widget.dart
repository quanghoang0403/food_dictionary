import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_dictionary/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class GoogleSignupButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        width: 300,
        //padding: EdgeInsets.all(4),
        child: OutlineButton.icon(
          label: Text(
            'Sign In With Google     ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          highlightedBorderColor: Colors.black,
          borderSide: BorderSide(color: Colors.blueGrey),
          textColor: Colors.blueGrey.shade600,
          //icon: FaIcon(FontAwesomeIcons.google),
          icon: Image.asset('assets/icons/google-logo.png', width: 23,),
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.login();
          },
        ),
      );
}