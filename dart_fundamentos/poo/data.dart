class Data {
  int dia;
  int mes;
  int ano;

  Data([this.dia = 1, this.mes = 1, this.ano = 1970]);

  @override
  String toString() {
    final d = dia.toString().padLeft(2, '0');
    final m = mes.toString().padLeft(2, '0');
    return '$d/$m/$ano';
  }
}

main() {
  var dataNiver = Data(7, 2, 2020);

  print(dataNiver);

  var dataCompra = Data(13, 10, 2021);

  print(dataCompra);

  var dataOpcionalAnoPadrao = Data(13, 10);
  var dataOpcionalMesAnoPadrao = Data(13);
  var dataOpcionalDiaMesAnoPadrao = Data();

  print(dataOpcionalAnoPadrao);
  print(dataOpcionalMesAnoPadrao);
  print(dataOpcionalDiaMesAnoPadrao);
}
