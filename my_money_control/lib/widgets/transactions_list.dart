import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_money_control/models/transaction.dart';
import 'package:my_money_control/widgets/transaction_tile.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(Transaction) onRemoveTransaction;

  TransactionsList({
    Key key,
    @required this.transactions,
    @required this.onRemoveTransaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Container(
        margin: const EdgeInsets.only(top: 8.0),
        child: SlideInRight(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              return TransactionTile(
                transaction: transactions[index],
                onRemove: onRemoveTransaction,
              );
            },
          ),
        ),
      ),
    );
  }
}
