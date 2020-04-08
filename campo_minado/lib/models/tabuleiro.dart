import 'dart:math';

import 'package:flutter/foundation.dart';

import 'package:campo_minado/models/campo.dart';

class Tabuleiro {
  final int linhas;
  final int colunas;
  final int numDeBombas;

  final List<Campo> _campos = [];

  Tabuleiro({
    @required this.linhas,
    @required this.colunas,
    @required this.numDeBombas,
  }) {
    _criarCampos();
    _relacionarVizinhos();
    _sortearBombas();
  }

  Tabuleiro.quadrado({
    @required numLinhasColunas,
    @required numDeBombas,
  }) : this(
          linhas: numLinhasColunas,
          colunas: numLinhasColunas,
          numDeBombas: numDeBombas,
        );

  void reiniciar() {
    this._campos.forEach((c) => c.reiniciar());

    _sortearBombas();
  }

  void revelarBombas() {
    this._campos.forEach((c) => c.revelarBomba());
  }

  void _criarCampos() {
    for (int l = 0; l < linhas; l++) {
      for (int c = 0; c < colunas; c++) {
        this._campos.add(Campo(linha: l, coluna: c));
      }
    }
  }

  void _relacionarVizinhos() {
    for (var campo in this._campos) {
      for (var vizinho in this._campos) {
        campo.adicionarVizinho(vizinho);
      }
    }
  }

  void _sortearBombas() {
    if (numDeBombas > this.linhas * this.colunas) {
      return;
    }

    int sorteadas = 0;

    while (sorteadas < numDeBombas) {
      int index = Random.secure().nextInt(this._campos.length);

      if (!_campos[index].minado) {
        _campos[index].minar();
        sorteadas++;
      }
    }
  }

  List<Campo> get campos => this._campos;

  bool get resolvido => this._campos.every((c) => c.resolvido);

  int get numCamposMinados => this.campos.where((c) => c.minado).length;
}
