import 'package:flutter/material.dart';

import 'package:meal_algorithms/models/meal.dart';

class MealDetailPage extends StatelessWidget {
  static const String route = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: const Text(''),
    );
  }
}
