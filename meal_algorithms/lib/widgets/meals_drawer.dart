import 'package:flutter/material.dart';

import 'package:meal_algorithms/pages/home_page.dart';
import 'package:meal_algorithms/pages/settings_page.dart';

class MealsDrawer extends StatelessWidget {
  Widget _item(IconData icon, String label, Function toRoute) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: toRoute,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mQuery = MediaQuery.of(context);
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: mQuery.size.height * 0.25,
            width: mQuery.size.width,
            color: Theme.of(context).accentColor,
            child: Center(
              child: Text(
                'VAMOS COZINHAR?',
                style: TextStyle(
                  fontFamily: 'ComicNeue',
                  fontSize: 24.0 * mQuery.textScaleFactor,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          _item(
            Icons.restaurant,
            'Refeições',
            () => Navigator.of(context).pushReplacementNamed(HomePage.route),
          ),
          _item(
            Icons.tune,
            'Configurações',
            () => Navigator.of(context).pushReplacementNamed(SettingsPage.route),
          ),
        ],
      ),
    );
  }
}
