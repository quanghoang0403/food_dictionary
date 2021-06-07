import 'package:food_dictionary/model/ingredient.dart';
class Recipe {
  final int id;
  final String name;
  final int calo;
  final int carbo;
  final int protein;
  final String urlImage;
  List<Ingredient> ingrdients = [];
  int choosed = 1;
  Recipe({
    this.id,
    this.name,
    this. calo,
    this. carbo,
    this.protein,
    this.urlImage,
    this.ingrdients,
    choosed = 1,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
    id: json['id'],
    name: json['name'],
    calo: json['calo'],
    carbo: json['carbo'],
    protein: json['protein'],
    urlImage: json['urlImage'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'calo': calo,
    'carbo': carbo,
    'protein': protein,
    'urlImage': urlImage,
  };
}

// class Book extends StatefulWidget {
//   final int id;
//   final String title;
//   final String author;
//   final String urlImage;
//
//   const Book({
//     Key? key,
//     required this.id,
//     required this.author,
//     required this.title,
//     required this.urlImage,
//   }) : super(key: key);
//
//   @override
//   _Book createState() => _BookWidgetState();
// }
//
// class _BookWidgetState extends State<Book> {
//   factory Book.fromJson(Map<String, dynamic> json) => Book(
//     id: json['id'],
//     author: json['author'],
//     title: json['title'],
//     urlImage: json['urlImage'],
//   );
//
//   Map<String, dynamic> toJson() => {
//     'id': id,
//     'title': title,
//     'author': author,
//     'urlImage': urlImage,
//   };
// }