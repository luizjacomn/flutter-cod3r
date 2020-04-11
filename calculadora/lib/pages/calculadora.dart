import 'package:calculadora/models/memoria.dart';
import 'package:flutter/material.dart';

import 'package:calculadora/widgets/display.dart';
import 'package:calculadora/widgets/teclado.dart';
import 'package:flutter/services.dart';

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final Memoria memoria = Memoria();

  void _aoClicar(String valorDigitado) {
    setState(() {
      memoria.invocarComando(valorDigitado);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Column(
        children: <Widget>[
          Visor(texto: memoria.valor),
          Teclado(_aoClicar),
        ],
      ),
    );
  }
}
