import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:my_money_control/utils/styles.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final void Function(DateTime) onDateSelect;

  const AdaptativeDatePicker({
    @required this.selectedDate,
    @required this.onDateSelect,
  });

  @override
  Widget build(BuildContext context) {
    return (Provider.of<bool>(context))
        ? Container(
            height: 180,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2020),
              maximumDate: DateTime.now(),
              onDateTimeChanged: onDateSelect,
            ),
          )
        : Row(
            children: <Widget>[
              Expanded(
                child: selectedDate == null
                    ? Text('Nenhuma data selecionada')
                    : RichText(
                        text: TextSpan(
                          text: 'Data da transação: ',
                          style: Theme.of(context).textTheme.subtitle,
                          children: <InlineSpan>[
                            TextSpan(
                              text:
                                  '${DateFormat('dd/MM/y').format(selectedDate)}',
                              style: boldTextStyle.copyWith(
                                color: Theme.of(context).primaryColorDark,
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
              FittedBox(
                child: FlatButton(
                  child: Text('alterar data'.toUpperCase()),
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime.now(),
                    ).then((date) => onDateSelect);
                  },
                ),
              ),
            ],
          );
  }
}
