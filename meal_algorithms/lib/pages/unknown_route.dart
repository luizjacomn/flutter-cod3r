import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class UnknownRoute extends StatelessWidget {
  final String routeName;

  const UnknownRoute({
    Key key,
    @required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('ROTA DESCONHECIDA'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/not_found.svg',
                width: size.width / 2,
                height: size.width / 2,
                semanticsLabel: 'Rota desconhecida',
              ),
              Text(
                'A rota "$routeName" não é conhecida pelo app.',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'ComicNeue',
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
