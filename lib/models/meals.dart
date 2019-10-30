import 'package:flutter/widgets.dart';

enum Complexity {
  Simple,
  Intermediate,
  Hard,
}
enum Affordability {
  Affordable,
  Pricey,
  Luxiours,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageurl;
  final List<String> ingredient;
  final List<String> step;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegitarian;

  const Meal(
      {@required this.id,
      @required this.title,
      @required this.categories,
      @required this.imageurl,
      @required this.ingredient,
      @required this.step,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      @required this.isGlutenFree,
      @required this.isLactoseFree,
      @required this.isVegan,
      @required this.isVegitarian});
}
