const ACELERACAO = 5;
const PARADO = 0;

class Carro {
  final int velocidadeMaxima;
  int velocidadeAtual = PARADO;

  Carro(this.velocidadeMaxima);

  int acelerar() {
    if (estaNoLimiteMaximo) {
      velocidadeAtual = velocidadeMaxima;
    } else {
      velocidadeAtual += ACELERACAO;
    }
    return velocidadeAtual;
  }

  int frear() {
    if (estaNoLimiteMinimo) {
      velocidadeAtual = PARADO;
    } else {
      velocidadeAtual -= ACELERACAO;
    }
    return velocidadeAtual;
  }

  bool get estaNoLimiteMaximo =>
      velocidadeAtual + ACELERACAO > velocidadeMaxima;
  bool get estaNoLimiteMinimo => velocidadeAtual - ACELERACAO < PARADO;
}
