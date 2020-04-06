import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';

import 'package:my_money_control/models/transaction.dart';

import 'package:my_money_control/utils/dates.dart';
import 'package:my_money_control/utils/style_provider.dart';

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

  final List<Transaction> _transactions = [];

  _addTransaction(final Transaction transaction) {
    setState(() {
      _transactions.add(transaction);

      _transactions.sort();
    });
  }

  _removeTransaction(final Transaction transaction) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == transaction.id);

      _transactions.sort();
    });
  }

  List<Transaction> get _recentTransactions {
    return _transactions
        .where((tr) => Dates.rencents(tr.date, _recentsNumber))
        .toList();
  }

  Widget _actionButton({icon, onPressed}) {
    return SlideInRight(
      child: (Provider.of<bool>(context) ?? false)
          ? GestureDetector(
              child: Icon(icon),
              onTap: onPressed,
            )
          : IconButton(
              icon: Icon(icon),
              onPressed: onPressed,
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isIOS = (Provider.of<bool>(context) ?? false);
    final size = MediaQuery.of(context).size;

    final title = FadeInLeft(
      child: const Text('My Money Control'),
    );

    final actions = <Widget>[
      Visibility(
        visible: isIOS,
        child: _actionButton(
          icon: CupertinoIcons.add_circled_solid,
          onPressed: () => _showModalForm(context, size, isIOS: true),
        ),
      ),
      _actionButton(
        icon: isIOS ? CupertinoIcons.refresh_thick : Icons.refresh,
        onPressed: StyleProvider().changeStyle,
      ),
    ];

    final PreferredSizeWidget appBar = isIOS
        ? CupertinoNavigationBar(
            middle: title,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: actions..insert(1, SizedBox(width: 4.0)),
            ),
          )
        : AppBar(
            title: title,
            actions: actions,
          );

    if (_transactions.isNotEmpty) {
      _transactions.sort();
    }

    return isIOS
        ? CupertinoPageScaffold(
            navigationBar: appBar,
            child: SafeArea(
              child: _buildBodyChildScaffold(size, context, isIOS),
            ),
          )
        : Scaffold(
            appBar: appBar,
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: isIOS
                ? Container()
                : ElasticInUp(
                    duration: const Duration(seconds: 2),
                    child: FloatingActionButton(
                      backgroundColor: Theme.of(context).accentColor,
                      child: Icon(
                        Icons.add,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        _showModalForm(context, size);
                      },
                    ),
                  ),
            body: _buildBodyChildScaffold(size, context, isIOS),
          );
  }

  void _showModalForm(BuildContext context, Size size, {bool isIOS: false}) {
    if (isIOS) {
      showCupertinoModalPopup(
          context: context,
          builder: (context) {
            return Container(
              child: TransactionForm(
                onCancel: Navigator.of(context).pop,
                onAddTransaction: (transaction) {
                  _addTransaction(transaction);
                  Navigator.of(context).pop();
                },
              ),
            );
          });
    } else {
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
    }
  }

  RenderObjectWidget _buildBodyChildScaffold(
      Size size, BuildContext context, isIOS) {
    return _transactions.isEmpty
        ? Center(
            child: isIOS
                ? FadeIn(
                    delay: const Duration(seconds: 1),
                    child: _buildEmptyList(),
                  )
                : SlideInRight(
                    from: size.width,
                    delay: const Duration(seconds: 1),
                    child: _buildEmptyList(),
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
          );
  }

  LayoutBuilder _buildEmptyList() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/empty_transactions.png',
              height: constraints.maxHeight * 0.25,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Sem transações',
              style: Theme.of(context).textTheme.title.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ],
        );
      },
    );
  }
}
