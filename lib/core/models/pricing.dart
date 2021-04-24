import 'package:flutter/foundation.dart';

class Price {
  final int amount;
  final String unit;
  final String description;

  Price({@required this.amount, @required this.unit, this.description});

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'unit': unit,
      'description': description,
    };
  }

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(amount: json['amount'], unit: json['unit']);
  }
}
