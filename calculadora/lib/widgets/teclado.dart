import 'package:calculadora/widgets/botao.dart';
import 'package:calculadora/widgets/linha_botoes.dart';
import 'package:flutter/material.dart';

class Teclado extends StatelessWidget {
  final Function(String) aoClicar;

  const Teclado(this.aoClicar);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 4,
      child: Container(
        child: Column(
          children: <Widget>[
            LinhaBotoes(
              botoes: [
                Botao.duplo(texto: 'AC', aoClicar: aoClicar, cor: ESCURO),
                Botao(texto: '%', aoClicar: aoClicar, cor: ESCURO),
                Botao.operacao(texto: '/', aoClicar: aoClicar),
              ],
            ),
            const SizedBox(height: 1),
            LinhaBotoes(
              botoes: [
                Botao(texto: '7', aoClicar: aoClicar),
                Botao(texto: '8', aoClicar: aoClicar),
                Botao(texto: '9', aoClicar: aoClicar),
                Botao.operacao(texto: 'x', aoClicar: aoClicar),
              ],
            ),
            const SizedBox(height: 1),
            LinhaBotoes(
              botoes: [
                Botao(texto: '4', aoClicar: aoClicar),
                Botao(texto: '5', aoClicar: aoClicar),
                Botao(texto: '6', aoClicar: aoClicar),
                Botao.operacao(texto: '-', aoClicar: aoClicar),
              ],
            ),
            const SizedBox(height: 1),
            LinhaBotoes(
              botoes: [
                Botao(texto: '1', aoClicar: aoClicar),
                Botao(texto: '2', aoClicar: aoClicar),
                Botao(texto: '3', aoClicar: aoClicar),
                Botao.operacao(texto: '+', aoClicar: aoClicar),
              ],
            ),
            const SizedBox(height: 1),
            LinhaBotoes(
              botoes: [
                Botao.duplo(texto: '0', aoClicar: aoClicar),
                Botao(texto: ',', aoClicar: aoClicar),
                Botao.operacao(texto: '=', aoClicar: aoClicar),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
