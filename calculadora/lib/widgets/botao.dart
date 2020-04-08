import 'package:flutter/material.dart';

const Color PADRAO = Color.fromRGBO(112, 112, 112, 1);
const Color ESCURO = Color.fromRGBO(82, 82, 82, 1);
const Color OPERACAO = Colors.cyan;

class Botao extends StatelessWidget {
  final String texto;
  final Function(String) aoClicar;
  final Color cor;
  final bool duplo;

  const Botao({
    @required this.texto,
    @required this.aoClicar,
    this.cor: PADRAO,
    this.duplo: false,
  });

  const Botao.duplo({
    @required this.texto,
    @required this.aoClicar,
    this.cor: PADRAO,
    this.duplo: true,
  });

  const Botao.operacao({
    @required this.texto,
    @required this.aoClicar,
    this.duplo: false,
    this.cor: OPERACAO,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: duplo ? 2 : 1,
      child: RaisedButton(
        color: this.cor,
        child: Text(
          this.texto,
          style: TextStyle(
            color: Colors.white,
            fontSize: 32.0,
            fontWeight: FontWeight.w300,
          ),
        ),
        onPressed: () => aoClicar(this.texto),
      ),
    );
  }
}
