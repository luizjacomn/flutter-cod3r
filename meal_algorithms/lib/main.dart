import 'package:flutter/material.dart';

import 'package:meal_algorithms/pages/categories_items_page.dart';
import 'package:meal_algorithms/pages/home_page.dart';
import 'package:meal_algorithms/pages/meal_detail_page.dart';
import 'package:meal_algorithms/pages/settings_page.dart';
import 'package:meal_algorithms/pages/unknown_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        CategoriesItemsPage.route: (_) => CategoriesItemsPage(),
        MealDetailPage.route: (_) => MealDetailPage(),
        SettingsPage.route: (_) => SettingsPage(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(fullscreenDialog: true,
          builder: (context) => UnknownRoute(
            routeName: settings.name,
          ),
        );
      },
    );
  }
}
