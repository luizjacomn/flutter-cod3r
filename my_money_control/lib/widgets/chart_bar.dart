import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_money_control/models/transaction_chart_vo.dart';
import 'package:my_money_control/utils/dates.dart';
import 'package:my_money_control/utils/format.dart';
import 'package:my_money_control/utils/styles.dart';

class ChartBar extends StatelessWidget {
  final TransactionChartVO transactionChartVO;

  const ChartBar({
    @required this.transactionChartVO,
  });

  @override
  Widget build(BuildContext context) {
    double tSize = 14.0 * MediaQuery.of(context).textScaleFactor;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: <Widget>[
          Tooltip(
            message: 'Saldo de ${transactionChartVO.label}',
            child: Material(
              child: transactionChartVO.saldo == 0
                  ? Text(
                      '-',
                      style: TextStyle(
                        fontSize: tSize,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      '${Format.currencyFormat(transactionChartVO.saldo)}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: tSize,
                        color: transactionChartVO.saldo > 0
                            ? Colors.green
                            : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                FractionallySizedBox(
                  heightFactor: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        width: 15.0,
                        color: const Color(0XFFEAEAEA),
                      ),
                      Container(
                        width: 15.0,
                        color: const Color(0XFFEAEAEA),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Visibility(
                      visible: !transactionChartVO.percentageIn.isNegative,
                      child: FractionallySizedBox(
                        heightFactor: !transactionChartVO.percentageIn.isNaN
                            ? transactionChartVO.percentageIn
                            : 0.0,
                        child: FlipInX(
                          child: Container(
                            width: 15.0,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: !transactionChartVO.percentageOut.isNegative,
                      child: FractionallySizedBox(
                        heightFactor: !transactionChartVO.percentageOut.isNaN
                            ? transactionChartVO.percentageOut
                            : 0.0,
                        child: FlipInX(
                          child: Container(
                            width: 15.0,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                FractionallySizedBox(
                  heightFactor: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Tooltip(
                        message: transactionChartVO.labelIn,
                        child: Container(
                          width: 15.0,
                          child: RotatedBox(
                            quarterTurns: 3,
                            child: Center(
                              child: Material(
                                color: Colors.transparent,
                                child: Text(
                                  '${Format.percentFormat(transactionChartVO.percentageIn, needMultiplyByHundred: true)}',
                                  style: TextStyle(
                                    fontSize: tSize,
                                    color: Colors.white,
                                    shadows: [
                                      BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 1.0,
                                        offset: const Offset(1.0, 1.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Tooltip(
                        message: transactionChartVO.labelOut,
                        child: Container(
                          width: 15.0,
                          child: RotatedBox(
                            quarterTurns: 3,
                            child: Center(
                              child: Material(
                                color: Colors.transparent,
                                child: Text(
                                  '${Format.percentFormat(transactionChartVO.percentageOut, needMultiplyByHundred: true)}',
                                  style: TextStyle(
                                    fontSize: tSize,
                                    color: Colors.white,
                                    shadows: [
                                      BoxShadow(
                                        color: Colors.black,
                                        spreadRadius: 1.0,
                                        blurRadius: 1.0,
                                        offset:const Offset(1.0, 1.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.0),
          RotatedBox(
            quarterTurns: 2,
            child: Transform.rotate(
              angle: 60.0,
              child: Dates.isToday(transactionChartVO.date)
                  ? Tooltip(
                      message: 'Hoje',
                      child: Material(
                        child: Text(transactionChartVO.label,
                            style: boldTextStyle.copyWith(
                              fontSize: tSize,
                              color: Theme.of(context).primaryColor,
                            ),),
                      ),
                    )
                  : Material(
                      child: Text(
                        transactionChartVO.label,
                        style: Theme.of(context).textTheme.subtitle.copyWith(
                              fontSize: tSize,
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
