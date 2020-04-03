import 'package:flutter/material.dart';
import 'package:my_money_control/models/transaction.dart';
import 'package:my_money_control/utils/styles.dart';
import 'package:my_money_control/widgets/transaction_tile.dart';

import 'package:animate_do/animate_do.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _valueController = TextEditingController();

  final _transactions = [
    Transaction(
      id: '1',
      title: 'FIES',
      description: 'Parcela 35',
      type: TransactionType.Out,
      value: 258.11,
    ),
    Transaction(
      id: '2',
      title: 'Energia',
      description: 'Fatura 03/2020',
      type: TransactionType.Out,
      value: 52.45,
      date: DateTime(2020, 4, 2),
    ),
    Transaction(
      id: '3',
      title: 'Salário',
      description: 'Salário 03/2020',
      type: TransactionType.In,
      value: 5000.45,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeInLeft(child: Text('My Money Control')),
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
                context: context,
                builder: (context) {
                  return _form();
                });
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // gráfico
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Card(
              child: Placeholder(
                fallbackHeight: 150,
                fallbackWidth: double.infinity,
              ),
            ),
          ),
          // lista de lançamentos
          Column(
            children: _transactions
                .map((tr) => TransactionTile(transaction: tr))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _form() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Nova transação',
              style: boldTextStyle.copyWith(
                fontSize: 24.0,
              ),
            ),
          ),
          Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'Título'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
