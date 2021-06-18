class Ingredient {
  final int id;
  final String name;
  final String cate;
  final String per;
  final String urlImage;
  final String calo;
  final String fat;
  final String sodium;
  final String carbo;
  final String fiber;
  final String sugar;
  final String protein;
  List<String> healthBenifit =[];
  int choosed = 1;
  Ingredient({
    this.id,
    this.name,
    this.cate,
    this.per,
    this.urlImage,
    this.calo,
    this.fat,
    this.sodium,
    this.carbo,
    this.fiber,
    this.sugar,
    this.protein,
    this.healthBenifit,
    choosed = 1,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
    id: json['id'],
    name: json['name'],
    // urlImage: json['urlImage'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'protein': protein,
    // 'urlImage': urlImage,
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