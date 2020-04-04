import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_money_control/models/transaction.dart';
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
  final _transactions = [
    Transaction.mock(
      id: '1',
      title: 'FIES',
      description: 'Parcela 35',
      type: TransactionType.Out,
      value: 258.11,
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
      value: 5000.45,
    ),
  ];

  _addTransaction(Transaction transaction) {
    setState(() {
      _transactions.insert(0, transaction);
    });
  }

  _removeTransaction(Transaction transaction) {
    setState(() {
      _transactions.remove(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: FadeInLeft(
          child: Row(
            children: <Widget>[
              Text('My Money Control - '),
              Text('${_transactions.length}'),
            ],
          ),
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
                  height: size.height * 0.90,
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
      body: Column(
        children: <Widget>[
          TransactionsChart(transactions: _transactions),
          TransactionsList(
            transactions: _transactions,
            onRemoveTransaction: _removeTransaction,
          ),
        ],
      ),
    );
  }
}
