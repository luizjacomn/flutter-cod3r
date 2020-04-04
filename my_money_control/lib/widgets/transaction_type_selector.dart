import 'package:flutter/material.dart';
import 'package:my_money_control/models/transaction.dart';
import 'package:my_money_control/utils/styles.dart';

class TransactionTypeSelector extends FormField<TransactionType> {
  final MainAxisAlignment mainAxisAlignment;

  TransactionTypeSelector({
    @required BuildContext context,
    @required FormFieldSetter<TransactionType> onSaved,
    @required FormFieldValidator<TransactionType> validator,
    @required TransactionType initialValue,
    bool autoValidate = false,
    this.mainAxisAlignment,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          autovalidate: autoValidate,
          builder: (state) {
            final size = MediaQuery.of(context).size;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: mainAxisAlignment,
                  children: [
                    Flexible(
                      child: InkWell(
                        onTap: () {
                          state.didChange(TransactionType.In);
                          onSaved(state.value);
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 250),
                          width: size.width / 4,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: initialValue == TransactionType.In
                                ? Colors.green
                                : Theme.of(context).disabledColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              bottomLeft: Radius.circular(8.0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Receita'.toUpperCase(),
                              style: boldTextStyle.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: InkWell(
                        onTap: () {
                          state.didChange(TransactionType.Out);
                          onSaved(state.value);
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 250),
                          width: size.width / 4,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: initialValue == TransactionType.Out
                                ? Colors.red
                                : Theme.of(context).disabledColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Despesa'.toUpperCase(),
                              style: boldTextStyle.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: state.hasError
                      ? Text(
                          state.errorText,
                          style: TextStyle(
                            color: Theme.of(context).errorColor,
                          ),
                        )
                      : Container(),
                ),
              ],
            );
          },
        );
}
