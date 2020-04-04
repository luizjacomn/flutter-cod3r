import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';

import 'package:my_money_control/models/transaction.dart';

class TransactionsChart extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionsChart({Key key, @required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideInDown(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Card(
          child: Placeholder(
            fallbackHeight: 150,
            fallbackWidth: double.infinity,
          ),
        ),
      ),
    );
  }
}
