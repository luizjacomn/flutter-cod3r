import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final pontuacao;

  Resultado(this.pontuacao);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            'Você fez:',
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          '${pontuacao.toString()} pontos',
          style: TextStyle(
            fontSize: 28.0,
          ),
        ),
      ],
    );
  }
}
