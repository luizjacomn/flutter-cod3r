import 'package:my_money_control/utils/format.dart';

class TransactionChartVO {
  final DateTime date;
  final double valueIn;
  final double valueOut;
  final double totalIn;
  final double totalOut;

  TransactionChartVO({
    this.date,
    this.valueIn,
    this.valueOut,
    this.totalIn,
    this.totalOut,
  });

  factory TransactionChartVO.fromMap(Map<String, Object> map) {
    return TransactionChartVO(
      date: map['date'],
      valueIn: map['value_in'],
      valueOut: map['value_out'],
      totalIn: map['total_in'],
      totalOut: map['total_out'] as double,
    );
  }

  String get label => Format.getDataDiaMes(date);

  double get percentageIn => valueIn / totalIn;

  double get percentageOut => valueOut / totalOut;

  String get labelIn {
    return 'Receitas de ($label): R\$ ${(valueIn).toStringAsFixed(2)} correspondente\na ${(percentageIn * 100).toStringAsFixed(2)}% do total do período (R\$ ${totalIn.toStringAsFixed(2)}).';
  }

  String get labelOut {
    return 'Despesas de ($label): R\$ ${(valueOut).toStringAsFixed(2)} correspondente\na ${(percentageOut * 100).toStringAsFixed(2)}% do total do período (R\$ ${totalOut.toStringAsFixed(2)}).';
  }

  double get saldo => valueIn - valueOut;
}
