import 'package:flutter/material.dart';
import 'package:food_dictionary/widgets/colors.dart';

class PrimaryText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight fontWeight;
  final double height;

  const PrimaryText({
    this.text,
    this.color: AppColors.cor2,
    this.size: 20,
    this.fontWeight: FontWeight.w400,
    this.height: 1.3
  });
  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
          fontFamily: 'Poppins',
          height: height),
    );
  }
}

class BasicText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;
  final double height;

  const BasicText({
    this.text,
    this.size: 20,
    this.color: AppColors.cor1,
    this.fontWeight: FontWeight.w400,
    this.height: 1.3
  });
  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: fontWeight,
          fontFamily: 'Poppins',
          height: height),
    );
  }
}

class SubText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight fontWeight;
  final double height;

  const SubText({
    this.text,
    this.size: 17,
    this.fontWeight: FontWeight.w400,
    this.height: 1.3
  });
  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          fontSize: size,
          fontWeight: fontWeight,
          color: Color(0xFF525050),
          fontFamily: 'Poppins',
          height: height),
    );
  }
}

class TextForPromoButton extends StatelessWidget {
  const TextForPromoButton({
    Key key,
    this.title,
    this.press,
  }) : super(key: key);
  final String title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              height: 40,
              child: Padding(
                  padding: EdgeInsets.only(left: 10, top: 0),
                  child: PrimaryText(
                    color: AppColors.cor1,
                    text: title,
                    fontWeight: FontWeight.w500,
                    height: 2.0,
                  )),
            ),
            Spacer(),
            GestureDetector(
              onTap: press,
              child: Container(
                alignment: Alignment.center,
                  height: 25,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    color: AppColors.cor1.withOpacity(0.75),
                  ),
                  child: PrimaryText(
                    text: 'More',
                    size: 17,
                    color: Colors.white,
                  ))
              )
          ],
        )
    );
  }
}
