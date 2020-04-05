import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';

import 'package:my_money_control/widgets/cupertino_text_form_field.dart';

class AdaptativeTextFormField extends StatelessWidget {
  final bool autofocus;
  final String label;
  final TextEditingController controller;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String Function(String) validator;
  final void Function(String) onFieldSubmitted;
  final FocusNode focusNode;

  const AdaptativeTextFormField({
    this.autofocus: false,
    @required this.label,
    @required this.controller,
    this.focusNode,
    this.textCapitalization: TextCapitalization.none,
    this.keyboardType: TextInputType.text,
    this.textInputAction,
    this.validator,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return (Provider.of<bool>(context) ?? false)
        ? Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: CupertinoTextFormField(
              autofocus: autofocus,
              controller: controller,
              focusNode: focusNode,
              textCapitalization: textCapitalization,
              textInputAction: textInputAction,
              validator: validator,
              placeholder: label,
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              onFieldSubmitted: onFieldSubmitted,
            ),
          )
        : TextFormField(
            autofocus: autofocus,
            controller: controller,
            focusNode: focusNode,
            textCapitalization: textCapitalization,
            textInputAction: textInputAction,
            validator: validator,
            decoration: InputDecoration(labelText: label),
            onFieldSubmitted: onFieldSubmitted,
          );
  }
}
