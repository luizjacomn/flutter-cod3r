import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_money_control/models/transaction.dart';
import 'package:my_money_control/models/transaction_chart_vo.dart';
import 'package:my_money_control/utils/dates.dart';
import 'package:my_money_control/utils/format.dart';
import 'package:my_money_control/widgets/chart_bar.dart';

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
    final size = MediaQuery.of(context).size;
    return Flexible(
      flex: 5,
      child: Column(
        children: <Widget>[
          ListTileTheme(
            contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
            child: ExpansionTile(
              title: Text('Resumo dos últimos $daysNumber dias'),
              trailing: Text(''),
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SlideInLeft(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Container(
                            height: 50.0,
                            width: size.width * 0.50,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorLight,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(24.0),
                                bottomRight: Radius.circular(24.0),
                              ),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Receitas'.toUpperCase(),
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColorDark,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 4.0),
                                    child: Chip(
                                      backgroundColor: Colors.white,
                                      label: Text(
                                        '${Format.currencyFormat(sumInForRange)}',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                SlideInRight(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        height: 50.0,
                        width: size.width * 0.50,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24.0),
                            bottomLeft: Radius.circular(24.0),
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4.0),
                                child: Chip(
                                  backgroundColor: Colors.white,
                                  label: Text(
                                    '${Format.currencyFormat(sumOutForRange)}',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Despesas'.toUpperCase(),
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColorDark,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SlideInLeft(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  child: ListView.builder(
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
