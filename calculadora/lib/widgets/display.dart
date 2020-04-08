import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

class Visor extends StatelessWidget {
  final String texto;

  const Visor({@required this.texto});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Container(
        color: Color.fromRGBO(48, 48, 48, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                texto,
                minFontSize: 20.0,
                maxFontSize: 80.0,
                maxLines: 1,
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 80.0,
                  fontWeight: FontWeight.w100,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
