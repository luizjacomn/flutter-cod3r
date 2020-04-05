import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';

import 'package:my_money_control/models/transaction.dart';
import 'package:my_money_control/models/transaction_chart_vo.dart';

import 'package:my_money_control/utils/dates.dart';

import 'package:my_money_control/widgets/chart_bar.dart';
import 'package:my_money_control/widgets/resume_tile.dart';

class TransactionsChart extends StatelessWidget {
  final List<Transaction> transactions;
  final int daysNumber;

  const TransactionsChart({
    @required this.transactions,
    @required this.daysNumber,
  });

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(daysNumber, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double sumIn = transactions
          .where((tr) => Dates.areEquals(tr.date, weekDay))
          .where((tr) => TransactionType.In == tr.type)
          .fold(0.0, (total, tr) => total + tr.value);

      double sumOut = transactions
          .where((tr) => Dates.areEquals(tr.date, weekDay))
          .where((tr) => TransactionType.Out == tr.type)
          .fold(0.0, (total, tr) => total + tr.value);

      return {
        'date': weekDay,
        'value_in': sumIn,
        'value_out': sumOut,
      };
    });
  }

  double get sumInForRange => groupedTransactions.fold(
      0.0, (total, entry) => total + entry['value_in']);

  double get sumOutForRange => groupedTransactions.fold(
      0.0, (total, entry) => total + entry['value_out']);

  @override
  Widget build(BuildContext context) {
    final mQuery = MediaQuery.of(context);
    return Flexible(
      flex: mQuery.orientation == Orientation.landscape ? 14 : 5,
      child: Column(
        children: <Widget>[
          ResumeTile(
            resumeDays: daysNumber,
            resumeInValue: sumInForRange,
            resumeOutValue: sumOutForRange,
          ),
          Expanded(
            child: SlideInLeft(
              child: Container(
                child: Center(
                  child: ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: groupedTransactions.length,
                    itemBuilder: (context, index) {
                      return ChartBar(
                        transactionChartVO: TransactionChartVO.fromMap(
                          groupedTransactions[index]
                            ..addEntries(
                              [
                                MapEntry('total_in', sumInForRange),
                                MapEntry('total_out', sumOutForRange),
                              ],
                            ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
