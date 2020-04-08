import 'package:flutter_test/flutter_test.dart';

import 'package:campo_minado/models/tabuleiro.dart';

main() {
  group('tabuleiro', () {
    test('Campos criados', () {
      Tabuleiro tabuleiro = Tabuleiro(linhas: 5, colunas: 7, numDeBombas: 0);

      expect(tabuleiro.campos.length, 35);
    });

    test('Bombas adicionadas', () {
      Tabuleiro tabuleiro = Tabuleiro.quadrado(
        numLinhasColunas: 4,
        numDeBombas: 3,
      );

      expect(tabuleiro.numCamposMinados, 3);
    });

    test('Ganhar jogo', () {
      Tabuleiro tabuleiro = Tabuleiro.quadrado(
        numLinhasColunas: 2,
        numDeBombas: 0,
      );

      tabuleiro.campos[0].minar();
      tabuleiro.campos[3].minar();

      tabuleiro.campos[0].alternarMarcacao();
      tabuleiro.campos[1].abrir();
      tabuleiro.campos[2].abrir();
      tabuleiro.campos[3].alternarMarcacao();

      expect(tabuleiro.resovido, isTrue);
    });

    test('Perder jogo', () {
      Tabuleiro tabuleiro = Tabuleiro.quadrado(
        numLinhasColunas: 2,
        numDeBombas: 0,
      );

      tabuleiro.campos[0].minar();
      tabuleiro.campos[3].minar();

      tabuleiro.campos[0].alternarMarcacao();
      tabuleiro.campos[1].abrir();
      tabuleiro.campos[2].abrir();

      expect(tabuleiro.campos[3].abrir, throwsException);
    });
  });
}
