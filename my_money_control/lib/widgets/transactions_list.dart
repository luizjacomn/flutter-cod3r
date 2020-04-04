import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_money_control/models/transaction.dart';
import 'package:my_money_control/utils/styles.dart';
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
      child: transactions.length == 0
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
          : SlideInRight(
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
    );
  }
}
