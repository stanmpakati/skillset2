import 'package:skillset/core/models/enums/price_units.dart';

class Price {
  final int amount;
  final PriceUnit unit;
  final String description;

  Price({this.amount, this.unit, this.description});
}
