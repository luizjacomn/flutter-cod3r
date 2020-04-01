import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String enunciado;

  Questao(this.enunciado);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: double.infinity,
      child: Text(
        enunciado,
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}
