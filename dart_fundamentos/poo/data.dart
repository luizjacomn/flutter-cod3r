class Data {
  int dia;
  int mes;
  int ano;

  @override
  String toString() {
    final d = dia.toString().padLeft(2, '0');
    final m = mes.toString().padLeft(2, '0');
    return '$d/$m/$ano';
  }
}

main() {
  var dataNiver = Data();
  dataNiver.dia = 7;
  dataNiver.mes = 2;
  dataNiver.ano = 2020;

  print(dataNiver);

  var dataCompra = Data();
  dataCompra.dia = 13;
  dataCompra.mes = 10;
  dataCompra.ano = 2021;

  print(dataCompra);
}
