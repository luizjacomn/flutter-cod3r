import 'package:campo_minado/widgets/campo_widget.dart';
import 'package:flutter/material.dart';

import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/models/tabuleiro.dart';

class TabuleiroWidget extends StatelessWidget {
  final Tabuleiro tabuleiro;
  final void Function(Campo) aoAbrir;
  final void Function(Campo) aoAlternarMarcacao;

  const TabuleiroWidget({
    @required this.tabuleiro,
    @required this.aoAbrir,
    @required this.aoAlternarMarcacao,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: tabuleiro.colunas,
        children: tabuleiro.campos.map((campo) {
          return CampoWidget(
            campo: campo,
            aoAbrir: aoAbrir,
            aoAlternarMarcacao: aoAlternarMarcacao,
          );
        }).toList(),
      ),
    );
  }
}
