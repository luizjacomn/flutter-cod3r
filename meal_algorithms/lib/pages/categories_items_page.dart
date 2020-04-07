import 'package:flutter/material.dart';

import 'package:meal_algorithms/models/category.dart';
import 'package:meal_algorithms/models/meal.dart';

import 'package:meal_algorithms/widgets/meal_tile.dart';

import 'package:meal_algorithms/pages/settings_page.dart';

class CategoriesItemsPage extends StatelessWidget {
  static const String route = '/category-meals';
  final List<Meal> meals;

  const CategoriesItemsPage(this.meals);

  @override
  Widget build(BuildContext context) {
    final Category category = ModalRoute.of(context).settings.arguments;

    final categoryMeals =
        meals.where((meal) => meal.categories.contains(category.id)).toList();

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
        child: categoryMeals.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.block,
                    size: 128.0,
                    color:
                        Theme.of(context).primaryColorLight.withOpacity(0.75),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Não há refeições para exibir.'.toUpperCase(),
                      style: Theme.of(context).textTheme.title,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context)
                        .pushReplacementNamed(SettingsPage.route),
                    child: Text(
                      'Verifique as configurações do app.'.toUpperCase(),
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemCount: categoryMeals.length,
                itemBuilder: (context, index) {
                  return MealTile(meal: categoryMeals[index]);
                },
              ),
      ),
    );
  }
}
