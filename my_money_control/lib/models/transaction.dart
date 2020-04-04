import 'package:flutter/foundation.dart';

enum TransactionType { In, Out }

class Transaction {
  String id;
  String title;
  String description;
  TransactionType type;
  double value;
  DateTime date;

  Transaction({
    this.id,
    this.title,
    this.description,
    this.type,
    this.value,
    DateTime date,
  }) : this.date = date ?? DateTime.now();

  Transaction.mock({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.type,
    @required this.value,
    DateTime date,
  }) : this.date = date ?? DateTime.now();
}
