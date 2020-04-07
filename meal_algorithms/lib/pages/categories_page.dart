import 'package:flutter/material.dart';

import 'package:meal_algorithms/widgets/category_tile.dart';

import 'package:meal_algorithms/data/dummy_data.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MEAL ALGORITHMS'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(20.0),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
        children: DUMMY_CATEGORIES
            .map(
              (cat) => CategoryTile(category: cat),
            )
            .toList(),
      ),
    );
  }
}
