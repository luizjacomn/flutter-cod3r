import 'package:flutter/material.dart';

import 'package:meal_algorithms/models/meal.dart';

import 'package:meal_algorithms/widgets/meal_tile.dart';

class FavoritesPage extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesPage(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: favoriteMeals.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.block,
                  size: 128.0,
                  color: Theme.of(context).primaryColorLight.withOpacity(0.75),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Não há refeições para exibir.'.toUpperCase(),
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: favoriteMeals.length,
              itemBuilder: (context, index) {
                return MealTile(meal: favoriteMeals[index]);
              },
            ),
    );
  }
}
