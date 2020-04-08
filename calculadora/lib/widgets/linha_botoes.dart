import 'package:flutter/material.dart';

import 'package:calculadora/widgets/botao.dart';

class LinhaBotoes extends StatelessWidget {
  final List<Botao> botoes;

  const LinhaBotoes({@required this.botoes});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: botoes.fold(<Widget>[], (lista, botao) {
          lista.isEmpty
              ? lista.add(botao)
              : lista.addAll([const SizedBox(width: 1), botao]);
          return lista;
        }),
      ),
    );
  }
}
