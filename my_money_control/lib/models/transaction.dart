import 'package:flutter/foundation.dart';

enum TransactionType { In, Out }

class Transaction implements Comparable<Transaction> {
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

  @override
  int compareTo(Transaction other) {
    int dateCmp = other.date.compareTo(this.date);
    if (dateCmp != 0) {
      return dateCmp;
    }

    return this.type.index.compareTo(other.type.index);
  }
}

