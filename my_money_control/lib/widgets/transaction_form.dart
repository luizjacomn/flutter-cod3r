import 'package:flutter/material.dart';

import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'package:my_money_control/models/transaction.dart';

import 'package:my_money_control/utils/styles.dart';

import 'package:my_money_control/widgets/adaptative_date_picker.dart';
import 'package:my_money_control/widgets/adaptative_text_form_field.dart';
import 'package:my_money_control/widgets/corner_rounded_button.dart';
import 'package:my_money_control/widgets/transaction_type_selector.dart';

class TransactionForm extends StatefulWidget {
  final Function(Transaction) onAddTransaction;
  final VoidCallback onCancel;

  const TransactionForm({
    Key key,
    @required this.onAddTransaction,
    @required this.onCancel,
  }) : super(key: key);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController(text: '');
  final _descriptionFocus = FocusNode();
  final _descriptionController = TextEditingController(text: '');
  final _valueFocus = FocusNode();
  final _valueController = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: ',',
    leftSymbol: 'R\$ ',
    initialValue: 0.0,
  );
  final _formKey = GlobalKey<FormState>();
  DateTime _selectedDate = DateTime.now();
  TransactionType _selectedType;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Nova transação',
                style: boldTextStyle.copyWith(
                  fontSize: 24.0,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
            ),
            const Divider(height: 0.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildForm(context),
              ),
            ),
            _buildButtonRow(context, size),
          ],
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AdaptativeTextFormField(
              autofocus: true,
              label: 'Título',
              controller: _titleController,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              validator: (text) {
                if (text.isNotEmpty && text.length > 3) {
                  return null;
                } else {
                  return 'Título deve conter pelo menos 3 caracteres';
                }
              },
              onFieldSubmitted: (text) => _descriptionFocus.requestFocus(),
            ),
            AdaptativeTextFormField(
              label: 'Descrição',
              controller: _descriptionController,
              focusNode: _descriptionFocus,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (text) => _valueFocus.requestFocus(),
            ),
            AdaptativeTextFormField(
              label: 'Valor',
              controller: _valueController,
              focusNode: _valueFocus,
              keyboardType: TextInputType.number,
              validator: (text) {
                if (text.isNotEmpty && _valueController.numberValue > 0.0) {
                  return null;
                } else {
                  return 'Valor deve ser maior que R\$ 0,00';
                }
              },
            ),
            AdaptativeDatePicker(
              selectedDate: _selectedDate,
              onDateSelect: _onDateChange,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: TransactionTypeSelector(
                context: context,
                mainAxisAlignment: MainAxisAlignment.center,
                initialValue: _selectedType,
                validator: (type) {
                  return type == null
                      ? 'Deve selecionar o tipo da transação'
                      : null;
                },
                onSaved: (type) {
                  setState(() {
                    this._selectedType = type;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onDateChange(DateTime date) {
    if (date == null) {
      return;
    }

    setState(() {
      _selectedDate = date;
    });
  }

  Widget _buildButtonRow(BuildContext context, Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CornerRoundedButton(
          cornerRounded: CornerRounded.Right,
          backgroundColor: Colors.red,
          label: 'cancelar',
          icon: Icons.close,
          onPressed: widget.onCancel,
        ),
        CornerRoundedButton(
          cornerRounded: CornerRounded.Left,
          backgroundColor: Theme.of(context).primaryColorDark,
          label: 'salvar',
          icon: Icons.save,
          onPressed: () {
            final transaction = Transaction(
              title: _titleController.text.trim(),
              description: _descriptionController.text?.trim(),
              date: _selectedDate,
              type: _selectedType,
              value: _valueController.numberValue,
            );

            if (_formKey.currentState.validate()) {
              widget.onAddTransaction(transaction);
            }
          },
        ),
      ],
    );
  }
}
