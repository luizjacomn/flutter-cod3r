import 'package:flutter/material.dart';
import 'package:meal_algorithms/models/meal.dart';

import 'package:meal_algorithms/widgets/meals_drawer.dart';

import 'package:meal_algorithms/pages/categories_page.dart';
import 'package:meal_algorithms/pages/favorites_page.dart';

class HomePage extends StatefulWidget {
  static const String route = '/';
  final List<Meal> favoriteMeals;

  const HomePage(this.favoriteMeals);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, Object>> _tabsMap;

  int _selectedTabIndex = 0;

  void _onTabSalect(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabsMap = [
      {'title': 'Lista de categorias', 'tab': CategoriesPage()},
      {
        'title': 'Receitas favoritas',
        'tab': FavoritesPage(widget.favoriteMeals)
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tabsMap[_selectedTabIndex]['title']),
      ),
      drawer: MealsDrawer(HomePage.route),
      body: _tabsMap[_selectedTabIndex]['tab'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        onTap: _onTabSalect,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: const Text('Categorias'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: const Text('Favoritas'),
          ),
        ],
      ),
    );
  }
}
