class WorkHistory {
  final String position;
  final String companyName;
  final int startingYear;
  final int finishingYear;
  final bool stillWorkingThere;

  WorkHistory({
    this.position,
    this.companyName,
    this.startingYear,
    this.finishingYear,
    this.stillWorkingThere,
  });

  Map<String, dynamic> toMap() {
    return {
      "position": position,
      "companyName": companyName,
      "startingYear": startingYear,
      "finishingYear": finishingYear,
      "stillWorkingThere": stillWorkingThere,
    };
  }
}
