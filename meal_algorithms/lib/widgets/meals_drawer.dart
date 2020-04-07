import 'package:flutter/material.dart';

import 'package:meal_algorithms/pages/home_page.dart';
import 'package:meal_algorithms/pages/settings_page.dart';

class MealsDrawer extends StatelessWidget {
  final String route;

  const MealsDrawer(this.route);

  Widget _item({
    BuildContext context,
    IconData icon,
    String label,
    String currentRoute,
    bool isCurrentRoute,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isCurrentRoute
            ? Theme.of(context).disabledColor
            : Theme.of(context).accentColor,
      ),
      title: Text(
        label,
        style: TextStyle(
          color: isCurrentRoute
              ? Theme.of(context).disabledColor
              : Theme.of(context).accentColor,
        ),
      ),
      onTap: isCurrentRoute
          ? null
          : () => Navigator.of(context).pushReplacementNamed(currentRoute),
    );
  }

  bool _isThisRoute(String route) => this.route == route;

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
            context: context,
            icon: Icons.restaurant,
            label: 'Refeições',
            currentRoute: HomePage.route,
            isCurrentRoute: _isThisRoute(HomePage.route),
          ),
          _item(
            context: context,
            icon: Icons.tune,
            label: 'Configurações',
            currentRoute: SettingsPage.route,
            isCurrentRoute: _isThisRoute(SettingsPage.route),
          ),
        ],
      ),
    );
  }
}
