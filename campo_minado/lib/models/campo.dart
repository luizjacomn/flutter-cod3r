import 'package:flutter/foundation.dart';

import 'package:campo_minado/models/vizinho_repetido_exceptio.dart';
import 'package:campo_minado/models/explosao_exception.dart';

class Campo {
  final int linha;
  final int coluna;
  final List<Campo> vizinhos = [];

  bool _aberto = false;
  bool _marcado = false;
  bool _minado = false;
  bool _explodido = false;

  Campo({
    @required this.linha,
    @required this.coluna,
  });

  Campo adicionarVizinho(Campo vizinho) {
    if (vizinhos.any((v) => v.equals(vizinho))) throw VizinhoRepetidoException();

    final deltaLinha = (this.linha - vizinho.linha).abs();
    final deltaColuna = (this.coluna - vizinho.coluna).abs();

    if (deltaLinha <= 1 && deltaColuna <= 1) {
      this.vizinhos.add(vizinho);
    }

    return this;
  }

  void abrir() {
    if (this._aberto) return;

    this._aberto = true;
    
    if (this._minado) {
      this._explodido = true;
      throw ExplosaoException();
    }

    if (vizinhancaSegura) {
      this.vizinhos.forEach((v) => v.abrir());
    }
  }

  void revelarBomba() {
    if (this._minado) {
      this._aberto = true;
    }
  }

  void reiniciar() {
    _aberto = false;
    _marcado = false;
    _minado = false;
    _explodido = false;
  }

  void minar() => this._minado = true;

  void alternarMarcacao() => this._marcado = !this._marcado;

  bool get resolvido {
    bool minadoEMarcado = this.minado && this.marcado;
    bool seguroEAberto = !this.marcado && this.aberto;
    return minadoEMarcado || seguroEAberto;
  }

  int get bombasAoRedor => this.vizinhos.where((v) => v.minado).length;

  int get numVizinhos => this.vizinhos.length;

  bool get aberto => this._aberto;

  bool get marcado => this._marcado;

  bool get minado => this._minado;

  bool get exploadido => this._explodido;

  bool get vizinhancaSegura {
    return this.vizinhos.every((v) => !v.minado);
  }

  bool equals(Campo other) {
    return this.coluna == other.coluna && this.linha == other.linha;
  }
}
