import 'package:flutter/material.dart';

import './resultado.dart';
import 'questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'enunciado': '1 - Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Azul', 'pontuacao': 8},
        {'texto': 'Verde', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 7},
        {'texto': 'Roxo', 'pontuacao': 5},
      ],
    },
    {
      'enunciado': '2 - Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Cachorro', 'pontuacao': 9},
        {'texto': 'Gato', 'pontuacao': 9},
        {'texto': 'Onça', 'pontuacao': 7},
        {'texto': 'Leão', 'pontuacao': 10},
      ],
    },
    {
      'enunciado': '3 - Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Ricardo', 'pontuacao': 5},
        {'texto': 'João', 'pontuacao': 4},
        {'texto': 'Maria', 'pontuacao': 7},
        {'texto': 'Carla', 'pontuacao': 10},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
      _pontuacaoTotal += pontuacao;
    }
  }

  bool get temSelecionada => _perguntaSelecionada < _perguntas.length;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          actions: <Widget>[
            Visibility(
              visible: !temSelecionada,
              child: IconButton(
                icon: Icon(Icons.update),
                onPressed: () {
                  _pontuacaoTotal = 0;
                  setState(() {
                    _perguntaSelecionada = 0;
                  });
                },
              ),
            )
          ],
        ),
        body: temSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                aoResponder: (pontuacao) => _responder(pontuacao),
              )
            : Resultado(_pontuacaoTotal),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() {
    return _PerguntaAppState();
  }
}
