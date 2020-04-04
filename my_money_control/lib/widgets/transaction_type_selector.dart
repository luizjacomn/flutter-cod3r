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
                      child: _buildInOption(
                        context,
                        state,
                        onSaved,
                        size,
                        initialValue,
                      ),
                    ),
                    Flexible(
                      child: _buildOutOption(
                        context,
                        state,
                        onSaved,
                        size,
                        initialValue,
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

  static void _onOptionChange(
    FormFieldState<TransactionType> state,
    FormFieldSetter<TransactionType> onSaved,
    TransactionType transactionType,
  ) {
    state.didChange(transactionType);
    state.validate();
    onSaved(state.value);
  }

  static Widget _buildInOption(
    BuildContext context,
    FormFieldState<TransactionType> state,
    FormFieldSetter<TransactionType> onSaved,
    Size size,
    TransactionType initialValue,
  ) {
    return InkWell(
      onTap: () => _onOptionChange(state, onSaved, TransactionType.In),
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
    );
  }

  static Widget _buildOutOption(
    BuildContext context,
    FormFieldState<TransactionType> state,
    FormFieldSetter<TransactionType> onSaved,
    Size size,
    TransactionType initialValue,
  ) {
    return InkWell(
      onTap: () => _onOptionChange(state, onSaved, TransactionType.Out),
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
    );
  }
}
