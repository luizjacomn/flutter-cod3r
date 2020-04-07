import 'package:flutter/material.dart';
import 'package:meal_algorithms/data/dummy_data.dart';

import 'package:meal_algorithms/models/category.dart';
import 'package:meal_algorithms/widgets/meal_tile.dart';

class CategoriesItemsPage extends StatelessWidget {
  static const String route = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final Category category = ModalRoute.of(context).settings.arguments;

    final meals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Hero(
              tag: category.id,
              child: Icon(category.icon),
            ),
            const SizedBox(width: 8.0),
            Text(category.title.toUpperCase()),
          ],
        ),
        backgroundColor: category.color,
      ),
      body: Center(
        child: ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) {
              final meal = meals[index];
              return MealTile(meal: meal);
            }),
      ),
    );
  }
}
