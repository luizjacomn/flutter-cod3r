import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';

import 'package:my_money_control/models/transaction.dart';
import 'package:my_money_control/utils/dates.dart';

import 'package:my_money_control/widgets/transaction_form.dart';
import 'package:my_money_control/widgets/transactions_chart.dart';
import 'package:my_money_control/widgets/transactions_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final _recentsNumber = 7;

  final _transactions = [
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

  _addTransaction(Transaction transaction) {
    setState(() {
      _transactions.add(transaction);

      _transactions.sort();
    });
  }

  _removeTransaction(Transaction transaction) {
    setState(() {
      _transactions.remove(transaction);

      _transactions.sort();
    });
  }

  List<Transaction> get _recentTransactions {
    return _transactions
        .where((tr) => Dates.rencents(tr.date, _recentsNumber))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _transactions.sort();
    return Scaffold(
      appBar: AppBar(
        title: FadeInLeft(
          child: Text('My Money Control'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: ElasticInDown(
        duration: Duration(seconds: 2),
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).accentColor,
          child: Icon(
            Icons.add,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Container(
                  height: size.height * 0.85,
                  child: TransactionForm(
                    onCancel: Navigator.of(context).pop,
                    onAddTransaction: (transaction) {
                      _addTransaction(transaction);
                      Navigator.of(context).pop();
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
      body: _transactions.isEmpty
          ? Center(
              child: FadeIn(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/empty_transactions.png',
                      height: 150,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Sem transações',
                      style: Theme.of(context).textTheme.title.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ],
                ),
              ),
            )
          : Column(
              children: <Widget>[
                TransactionsChart(
                  transactions: _recentTransactions,
                  daysNumber: _recentsNumber,
                ),
                TransactionsList(
                  transactions: _transactions,
                  onRemoveTransaction: _removeTransaction,
                ),
              ],
            ),
    );
  }
}
