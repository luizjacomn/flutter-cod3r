import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() aoSelecionar;

  Resposta(this.texto, this.aoSelecionar);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      width: double.maxFinite,
      child: OutlineButton(
        borderSide: BorderSide(color: Theme.of(context).primaryColor),
        onPressed: aoSelecionar,
        child: Text(
          texto.toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}
