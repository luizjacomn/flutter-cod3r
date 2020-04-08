import 'package:flutter_test/flutter_test.dart';

import 'package:campo_minado/models/campo.dart';

main() {
  group('campo', () {
    test('Abrir CAMPO MINADO', () {
      Campo campoMinado = Campo(linha: 0, coluna: 0);
      campoMinado.minar();

      expect(campoMinado.abrir, throwsException);
    });

    test('Abrir CAMPO SEGURO', () {
      Campo campoSeguro = Campo(linha: 0, coluna: 0);
      campoSeguro.abrir();

      expect(campoSeguro.aberto, isTrue);
    });

    test('Adicionar NÃO VIZINHO', () {
      Campo campo = Campo(linha: 0, coluna: 0);

      Campo naoVizinho = Campo(linha: 0, coluna: 3);

      campo.adicionarVizinho(naoVizinho);

      expect(campo.vizinhos.isEmpty, isTrue);
    });

    test('Adicionar VIZINHOS', () {
      Campo campo = Campo(linha: 0, coluna: 0);

      Campo vizinho1 = Campo(linha: 0, coluna: 1);
      Campo vizinho2 = Campo(linha: 1, coluna: 0);
      Campo vizinho3 = Campo(linha: 1, coluna: 1);

      campo.adicionarVizinho(vizinho1)
        ..adicionarVizinho(vizinho2)
        ..adicionarVizinho(vizinho3);

      expect(campo.numVizinhos, 3);
    });

    test('Vizinho SÃO IGUAIS', () {
      Campo vizinho1 = Campo(linha: 0, coluna: 0);
      Campo vizinho2 = Campo(linha: 0, coluna: 0);

      expect(vizinho1.equals(vizinho2), isTrue);
    });

    test('Adicionar VIZINHOS REPETIDOS', () {
      Campo campo = Campo(linha: 0, coluna: 0);

      Campo vizinho1 = Campo(linha: 0, coluna: 1);
      Campo vizinho2 = Campo(linha: 1, coluna: 1);
      Campo vizinho3 = Campo(linha: 1, coluna: 1);

      campo.adicionarVizinho(vizinho1)..adicionarVizinho(vizinho2);

      expect(() => campo.adicionarVizinho(vizinho3), throwsException);
    });

    test('Vizinhança É SEGURA', () {
      Campo campo = Campo(linha: 0, coluna: 0);

      Campo vizinho1 = Campo(linha: 0, coluna: 1);
      Campo vizinho2 = Campo(linha: 1, coluna: 0);
      Campo vizinho3 = Campo(linha: 1, coluna: 1);

      campo.adicionarVizinho(vizinho1)
        ..adicionarVizinho(vizinho2)
        ..adicionarVizinho(vizinho3);

      expect(campo.vizinhancaSegura, isTrue);
      expect(campo.bombasAoRedor, 0);
    });

    test('Vizinhança NÃO SEGURA', () {
      Campo campo = Campo(linha: 0, coluna: 0);

      Campo vizinho1 = Campo(linha: 0, coluna: 1);
      vizinho1.minar();

      Campo vizinho2 = Campo(linha: 1, coluna: 0);

      Campo vizinho3 = Campo(linha: 1, coluna: 1);
      vizinho3.minar();

      campo.adicionarVizinho(vizinho1)
        ..adicionarVizinho(vizinho2)
        ..adicionarVizinho(vizinho3);

      expect(campo.vizinhancaSegura, isFalse);
      expect(campo.bombasAoRedor, 2);
    });
  });
}
