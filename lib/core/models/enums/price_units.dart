enum PriceUnit { hour, job, other }

extension ParseToString on PriceUnit {
  String toShortString() {
    return this.toString().split('.').last;
  }
}
