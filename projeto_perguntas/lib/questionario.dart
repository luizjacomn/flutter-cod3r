import 'package:flutter/material.dart';

import 'questao.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) aoResponder;

  const Questionario({
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.aoResponder,
  });
  bool get temSelecionada => perguntaSelecionada < perguntas.length;

  get listaRespostas => perguntas[perguntaSelecionada]['respostas'];

  @override
  Widget build(BuildContext context) {
    var respostas = temSelecionada
        ? listaRespostas
            .map<Widget>(
              (resp) => Resposta(
                resp['texto'],
                () => aoResponder(resp['pontuacao']),
              ),
            )
            .toList()
        : null;
    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['enunciado']),
        ...respostas,
      ],
    );
  }
}
