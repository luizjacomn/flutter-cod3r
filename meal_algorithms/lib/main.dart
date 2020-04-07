import 'package:flutter/material.dart';

import 'package:meal_algorithms/data/dummy_data.dart';

import 'package:meal_algorithms/models/meal.dart';
import 'package:meal_algorithms/models/settings.dart';

import 'package:meal_algorithms/pages/categories_items_page.dart';
import 'package:meal_algorithms/pages/home_page.dart';
import 'package:meal_algorithms/pages/meal_detail_page.dart';
import 'package:meal_algorithms/pages/settings_page.dart';
import 'package:meal_algorithms/pages/unknown_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings _settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;

  void _filterMeals(Settings settings) {
    setState(() {
      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.glutenFree && !meal.glutenFree;
        final filterLactose = settings.lactoseFree && !meal.lactoseFree;
        final filterVegan = settings.vegan && !meal.vegan;
        final filterVegetarian = settings.vegetarian && !meal.vegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal Algorithms',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey[800],
        accentColor: Colors.amberAccent,
        fontFamily: 'Quicksand',
        appBarTheme: ThemeData.dark().appBarTheme.copyWith(
              textTheme: TextTheme(
                title: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'ComicNeue',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
      ),
      routes: {
        HomePage.route: (_) => HomePage(),
        CategoriesItemsPage.route: (_) => CategoriesItemsPage(_availableMeals),
        MealDetailPage.route: (_) => MealDetailPage(),
        SettingsPage.route: (_) => SettingsPage(_settings, _filterMeals),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          fullscreenDialog: true,
          builder: (context) => UnknownRoute(
            routeName: settings.name,
          ),
        );
      },
    );
  }
}
