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

class subText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight fontWeight;
  final double height;

  const subText({
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
