import 'package:flutter/material.dart';
import 'package:food_dictionary/widgets/colors.dart';
class SearchBox extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const SearchBox({
    this.onChanged,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: AppColors.lightGray.withOpacity(0.5),         
        )
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(Icons.search),
          border: InputBorder.none,
          hintText: "Search your ingredient here",
          hintStyle: TextStyle(fontSize: 18)
          ),
          )
    );
  }
}
