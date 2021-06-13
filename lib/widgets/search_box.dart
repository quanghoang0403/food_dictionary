import 'package:flutter/material.dart';
import 'package:food_dictionary/widgets/colors.dart';
class SearchBox extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const SearchBox({
    this.title,
    this.onChanged,
    Key key,
  }) : super(key: key);

  final String title;

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
          hintText: "$title",
          hintStyle: TextStyle(fontSize: 18)
          ),
          )
    );
  }
}

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
    Key key,
this.text,
this.onChanged,
this.hintText,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: Colors.black, fontSize: 18);
    final styleHint = TextStyle(color: Colors.black54, fontSize: 18);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      height: 55,
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: AppColors.lightGray.withOpacity(0.5),
          )
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: AppColors.cor2),
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
            child: Icon(Icons.close, color: style.color),
            onTap: () {
              controller.clear();
              widget.onChanged('');
              FocusScope.of(context).requestFocus(FocusNode());
            },
          )
              : null,
          hintText: widget.hintText,
          hintStyle: style,
          border: InputBorder.none,
        ),
        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
}
