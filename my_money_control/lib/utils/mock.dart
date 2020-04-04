import 'package:my_money_control/models/transaction.dart';

class Mock {
  static List<Transaction> get transactions {
    return [
        Transaction.mock(
          id: '0',
          title: 'Água',
          description: 'Fatura 02/2020',
          type: TransactionType.Out,
          value: 49.45,
          date: DateTime(2020, 3, 5),
        ),
        Transaction.mock(
          id: '1',
          title: 'FIES',
          description: 'Parcela 35',
          type: TransactionType.Out,
          value: 258.11,
          date: DateTime(2020, 4, 3),
        ),
        Transaction.mock(
          id: '2',
          title: 'Energia',
          description: 'Fatura 03/2020',
          type: TransactionType.Out,
          value: 52.45,
          date: DateTime(2020, 4, 2),
        ),
        Transaction.mock(
          id: '3',
          title: 'Salário',
          description: 'Salário 03/2020',
          type: TransactionType.In,
          value: 200.45,
        ),
        Transaction.mock(
          id: '4',
          title: 'Rendimentos',
          description: 'Nuconta 03/2020',
          type: TransactionType.In,
          value: 100.45,
          date: DateTime(2020, 4, 2),
        ),
    ];
  }
}
