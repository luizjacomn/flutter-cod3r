import 'package:flutter/material.dart';

import 'package:my_money_control/pages/home_page.dart';

void main() => runApp(MyMoneyControlApp());

class MyMoneyControlApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Money Control',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.greenAccent,
      ),
      home: HomePage(),
    );
  }
}
