import 'package:flutter/material.dart';

import 'package:meal_algorithms/widgets/meals_drawer.dart';

class SettingsPage extends StatelessWidget {
  static const String route = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CONFIGURAÇÕES'),
      ),
      drawer: MealsDrawer(),
      body: Center(
        child: const Text('CONFIGURAÇÕES'),
      ),
    );
  }
}
