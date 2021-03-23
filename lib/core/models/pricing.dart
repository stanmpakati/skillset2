import 'package:flutter/foundation.dart';
import 'package:newserverdemo/core/models/enums/price_units.dart';

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
}
