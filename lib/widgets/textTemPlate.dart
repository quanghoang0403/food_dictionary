import 'package:flutter/material.dart';
import 'package:food_dictionary/widgets/colors.dart';
import 'package:food_dictionary/widgets/style.dart';
class TextForPromoButon extends StatelessWidget {
  const TextForPromoButon({
    Key key,
    this.title,
    this.press,
  }) : super(key: key);
  final String title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: <Widget>[
            Container(
              height: 50,
              child: Padding(
                  padding: EdgeInsets.only(left: 10, top: 0),
                  child: PrimaryText(
                    color: AppColors.cor1,
                    text: title,
                    fontWeight: FontWeight.w600,
                    height: 2.0,
                  )),
            ),
            Spacer(),
            FlatButton(
              height: 12,
                minWidth: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                color: AppColors.cor1.withOpacity(0.75),
                onPressed: press,
                child: PrimaryText(
                  text: 'More',
                  size: 17,
                  color: Colors.white,
                ))
          ],
        )
    );
  }
}
