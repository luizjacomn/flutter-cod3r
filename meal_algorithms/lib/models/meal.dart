import 'package:flutter/foundation.dart';

enum Complexity { Easy, Medium, Hard }

enum Cost { Cheap, Fair, Expensive }

class Meal {
  final String id;
  final String title;
  final List<String> categories;
  final List<String> ingredients;
  final List<String> steps;
  final Duration duration;
  final bool glutenFree;
  final bool lactoseFree;
  final bool vegan;
  final bool vegetarian;
  final Complexity complexity;
  final Cost cost;
  final String imageURL;

  const Meal({
    @required this.id,
    @required this.title,
    @required this.categories,
    @required this.ingredients,
    @required this.steps,
    @required this.duration,
    @required this.glutenFree,
    @required this.lactoseFree,
    @required this.vegan,
    @required this.vegetarian,
    @required this.complexity,
    @required this.cost,
    @required this.imageURL,
  });

  String get complexityLabel {
    switch (complexity) {
      case Complexity.Easy:
        return 'Fácil';
      case Complexity.Medium:
        return 'Média';
      case Complexity.Hard:
        return 'Difícil';
      default:
        return 'Desconhecida';
    }
  }

  String get costLabel {
    switch (cost) {
      case Cost.Cheap:
        return 'Barato';
      case Cost.Fair:
        return 'Justo';
      case Cost.Expensive:
        return 'Caro';
      default:
        return 'Desconhecido';
    }
  }
}
