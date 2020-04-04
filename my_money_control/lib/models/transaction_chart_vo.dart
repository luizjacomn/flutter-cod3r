import 'package:intl/intl.dart';

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

  String get label => DateFormat('dd/MM').format(date);

  double get percentageIn => valueIn / totalIn;

  double get percentageOut => valueOut / totalOut;

  String get labelIn {
    if (valueIn == 0.0) {
      return 'Não há transações de receita para esta data';
    }

    return 'Receitas de ($label): ${Format.currencyFormat(valueIn)} correspondente\na ${Format.percentFormat(percentageIn)} do total do período (${Format.currencyFormat(totalIn)}).';
  }

  String get labelOut {
    if (valueOut == 0.0) {
      return 'Não há transações de despesa para esta data';
    }
    
    return 'Despesas de ($label): ${Format.currencyFormat(valueOut)} correspondente\na ${Format.percentFormat(percentageOut)} do total do período (${Format.currencyFormat(totalOut)}).';
  }

  double get saldo => valueIn - valueOut;
}
