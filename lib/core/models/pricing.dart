import 'package:flutter/foundation.dart';
import 'package:newserverdemo/core/models/enums/price_units.dart';

class Price {
  final int amount;
  final PriceUnit unit;
  final String description;

  Price({@required this.amount, @required this.unit, this.description});
}
