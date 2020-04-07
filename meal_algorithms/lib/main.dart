import 'package:flutter/material.dart';

import 'package:meal_algorithms/pages/categories_page.dart';

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
      home: CategoriesPage(),
    );
  }
}
