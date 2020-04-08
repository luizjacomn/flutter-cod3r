import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:meal_algorithms/models/meal.dart';

class MealDetailPage extends StatelessWidget {
  static const String route = '/meal-detail';

  final bool Function(Meal) isFavorite;
  final Function(Meal) toggleFav;

  const MealDetailPage(this.isFavorite, this.toggleFav);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final Meal meal = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: meal.imageURL,
                height: size.height / 3,
                width: size.width,
                fit: BoxFit.cover,
                placeholder: (_, __) => Container(
                  height: size.height / 3,
                  child: Center(child: const CircularProgressIndicator()),
                ),
                errorWidget: (_, __, ___) => Icon(Icons.broken_image),
              ),
            ),
            _buildSectionTitle(context, 'INGREDIENTES'),
            _buildSectionContainer(
              context,
              size,
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      child: Text(
                        meal.ingredients[index],
                        style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                    ),
                    color: Theme.of(context).accentColor,
                  );
                },
              ),
            ),
            _buildSectionTitle(context, 'PASSOS'),
            _buildSectionContainer(
              context,
              size,
              ListView.separated(
                itemCount: meal.steps.length,
                separatorBuilder: (_, __) => Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).accentColor,
                      child: Text(
                        '${index + 1}',
                      ),
                    ),
                    title: Text(meal.steps[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorite(meal) ? Icons.favorite : Icons.favorite_border),
        onPressed: () => toggleFav(meal),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget _buildSectionContainer(BuildContext context, Size size, Widget child) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      height: size.height / 3,
      width: size.width / 1.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Theme.of(context).primaryColorLight,
        ),
      ),
      child: child,
    );
  }
}
