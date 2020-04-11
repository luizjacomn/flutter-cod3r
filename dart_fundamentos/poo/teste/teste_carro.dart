import '../modelo/carro.dart';

void main() {
  Carro carro = Carro(180);

  while (!carro.estaNoLimiteMaximo) {
    carro.acelerar();
    print('Acelerando a ${carro.velocidadeAtual} km/h');
  }

  print('O carro está acelerado a ${carro.velocidadeAtual} km/h');

  while (!carro.estaNoLimiteMinimo) {
    carro.frear();
    print('Freando a ${carro.velocidadeAtual} km/h');
  }

  print('O carro está parado a ${carro.velocidadeAtual} km/h');
}
