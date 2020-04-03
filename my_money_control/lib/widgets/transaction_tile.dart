import 'package:flutter/material.dart';

import 'package:my_money_control/models/transaction.dart';
import 'package:my_money_control/utils/format.dart';
import 'package:my_money_control/utils/styles.dart';

class TransactionTile extends StatelessWidget {
  final Transaction transaction;

  const TransactionTile({Key key, @required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            flex: 4,
            child: _buildTypeAndValue(size.width / 4),
          ),
          Expanded(
            flex: 8,
            child: _buildTitleDescriptionAndDateTime(context),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: OutlineButton(
              borderSide: BorderSide(color: Colors.redAccent),
              child: Text(
                'remove'.toUpperCase(),
                style: TextStyle(color: Colors.redAccent),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeAndValue(width) {
    return Container(
            width: width,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  transaction.type == TransactionType.In
                      ? Icons.arrow_upward
                      : Icons.arrow_downward,
                  color: transaction.type == TransactionType.In
                      ? Colors.green
                      : Colors.red,
                ),
                Text(
                  'R\$ ${transaction.value.toStringAsFixed(2)}',
                  style: boldTextStyle.copyWith(
                    color: transaction.type == TransactionType.In
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
              ],
            ),
          );
  }

  Widget _buildTitleDescriptionAndDateTime(BuildContext context) {
    return Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  transaction.title,
                  style: titleTextStyle.copyWith(
                    color: Theme.of(context).accentColor,
                  ),
                ),
                Text(
                  transaction.description,
                  style: titleTextStyle,
                ),
                Text(
                  Format.getDataFormatada(transaction.date),
                  style: subtitleTextStyle,
                ),
              ],
            ),
          );
  }

  
}
