import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_dictionary/widgets/colors.dart';
import 'package:food_dictionary/widgets/style.dart';
//import 'package:foodiction1/widgets/style.dart';
//import 'package:foodiction1/widgets/body.dart';

class TempFood extends StatelessWidget {
  const TempFood({
    Key key,
    this.image,
    this.title,
    this.press,
    @required this.size,
  }) : super(key: key);

  final Size size;
  final String image, title;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10, left: 20, bottom: 10),
        width: size.width * 0.35,
        child: Column(
          children: <Widget>[
            Image.asset(image),
            GestureDetector(
              onTap: press,
              child: Container(
                padding: EdgeInsets.all(10),
                //color: AppColors.cor1,
                decoration:
                BoxDecoration(color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 20),
                        blurRadius: 20,
                        color: AppColors.cor1.withOpacity(0.2),
                      ),
                    ]),
                child: Row(
                  children: <Widget>[
                    RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "$title".toUpperCase(),
                              style: Theme.of(context).textTheme.button,
                            )
                          ],
                        )
                    )
                  ],
                ),
              )
            )],
            ));

  }
}