import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:my_money_control/utils/style_provider.dart';

import 'package:my_money_control/pages/home_page.dart';

void main() => runApp(MyMoneyControlApp());

class MyMoneyControlApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider.value(stream: StyleProvider().iosStyle),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Money Control',
        themeMode: ThemeMode.light,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.greenAccent,
          fontFamily: 'Quicksand',
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: const TextStyle(
                    fontFamily: 'ComicNeue',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}
