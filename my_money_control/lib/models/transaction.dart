import 'package:flutter/foundation.dart';

enum TransactionType { In, Out }

class Transaction {
  final String id;
  final String title;
  final String description;
  final TransactionType type;
  final double value;
  final DateTime date;

  Transaction({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.type,
    @required this.value,
    DateTime date,
  }) : this.date = date ?? DateTime.now();
}
