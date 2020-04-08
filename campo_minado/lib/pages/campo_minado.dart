import 'package:flutter/material.dart';

import 'package:campo_minado/models/explosao_exception.dart';
import 'package:campo_minado/models/tabuleiro.dart';
import 'package:campo_minado/models/campo.dart';

import 'package:campo_minado/widgets/tabuleiro_widget.dart';
import 'package:campo_minado/widgets/resultado_widget.dart';

class CampoMinado extends StatefulWidget {
  @override
  _CampoMinadoState createState() => _CampoMinadoState();
}

class _CampoMinadoState extends State<CampoMinado> {
  final _sKey = GlobalKey<ScaffoldState>();
  static const NUMERO_COLUNAS = 15;

  bool _venceu;
  Tabuleiro _tabuleiro;

  Tabuleiro _getTabuleiro({@required double width, @required double height}) {
    if (_tabuleiro == null) {
      double tamanhoCampo = width / NUMERO_COLUNAS;
      int numLinhas = (height / tamanhoCampo).floor();

      _tabuleiro = Tabuleiro(
        linhas: numLinhas,
        colunas: NUMERO_COLUNAS,
        numDeBombas: (numLinhas * NUMERO_COLUNAS * 0.4).floor(),
      );
    }

    return _tabuleiro;
  }

  void _reiniciar() {
    setState(() {
      _venceu = null;
      _tabuleiro.reiniciar();
    });
  }

  void _abrir(Campo campo) {
    if (_venceu != null) {
      _showSnackAlert();
      return;
    }

    setState(() {
      try {
        campo.abrir();
        if (_tabuleiro.resolvido) {
          _venceu = true;
        }
      } on ExplosaoException {
        _venceu = false;
        _tabuleiro.revelarBombas();
      }
    });
  }

  void _showSnackAlert() {
    _sKey.currentState.hideCurrentSnackBar();
    _sKey.currentState.showSnackBar(
      SnackBar(
        content: Text('Jogo encerrado!'),
        action: SnackBarAction(
          label: 'REINICIAR',
          onPressed: _reiniciar,
          textColor: Colors.yellowAccent,
        ),
      ),
    );
  }

  void _alternarMarcacao(Campo campo) {
    if (_venceu != null) return;
    setState(() {
      campo.alternarMarcacao();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campo Minado',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        key: _sKey,
        appBar: ResultadoWidget(
          venceu: _venceu,
          aoReiniciar: _reiniciar,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return TabuleiroWidget(
              tabuleiro: _getTabuleiro(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
              ),
              aoAbrir: _abrir,
              aoAlternarMarcacao: _alternarMarcacao,
            );
          },
        ),
      ),
    );
  }
}
