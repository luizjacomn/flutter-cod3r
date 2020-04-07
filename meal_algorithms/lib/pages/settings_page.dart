import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:meal_algorithms/models/settings.dart';

import 'package:meal_algorithms/widgets/meals_drawer.dart';

class SettingsPage extends StatefulWidget {
  static const String route = '/settings';
  final Function(Settings) onSettingsChange;
  final Settings settings;

  const SettingsPage(this.settings, this.onSettingsChange);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Settings settings;

  Widget _switch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChange,
  ) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: CupertinoSwitch(
        activeColor: Theme.of(context).accentColor,
        value: value,
        onChanged: (bool) {
          onChange(bool);

          widget.onSettingsChange(settings);
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    this.settings = widget.settings;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CONFIGURAÇÕES'),
      ),
      drawer: MealsDrawer(SettingsPage.route),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                _switch(
                  'Sem glutén',
                  'Exibe apenas refeições sem glutén',
                  settings.glutenFree,
                  (value) => setState(() => settings.glutenFree = value),
                ),
                _switch(
                  'Sem lactose',
                  'Exibe apenas refeições sem lactose',
                  settings.lactoseFree,
                  (value) => setState(() => settings.lactoseFree = value),
                ),
                _switch(
                  'Veganas',
                  'Exibe apenas refeições veganas',
                  settings.vegan,
                  (value) => setState(() => settings.vegan = value),
                ),
                _switch(
                  'Vegetarianas',
                  'Exibe apenas refeições vegetarianas',
                  settings.vegetarian,
                  (value) => setState(() => settings.vegetarian = value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
