class Data {
  int dia;
  int mes;
  int ano;

  Data([this.dia = 1, this.mes = 1, this.ano = 1970]);

  Data.com({this.dia: 1, this.mes: 1, this.ano: 1970});

  Data.ultimoDiaDoAno(this.ano) {
    this.dia = 31;
    this.mes = 12;
  }

  Data.ultimoDiaDoMes(this.mes, this.ano) {
    switch (this.mes) {
      case 1:
      case 3:
      case 5:
      case 7:
      case 8:
      case 10:
      case 12:
        this.dia = 31;
        break;
      case 2:
        this.dia = this.ano % 4 == 0 ? 29 : 28;
        break;
      case 4:
      case 6:
      case 9:
      case 11:
      default:
        this.dia = 30;
    }
  }

  @override
  String toString() {
    final d = dia.toString().padLeft(2, '0');
    final m = mes.toString().padLeft(2, '0');
    final a = ano.toString().padLeft(4, '0');
    return '$d/$m/$a';
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

  print(Data.com(dia: 25, mes: 12, ano: 0));

  print(Data.ultimoDiaDoAno(2019));

  print('============== MESES =================');
  for (var mes = 1; mes <= 12; mes++) {
    print(Data.ultimoDiaDoMes(mes, 2020));
  }
}
