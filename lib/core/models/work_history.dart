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

  factory WorkHistory.fromJson(Map<String, dynamic> json) {
    return WorkHistory(
      companyName: json['companyName'],
      position: json['position'],
      startingYear: json['startingYear'],
      finishingYear: json['finishingYear'],
      stillWorkingThere: json['stillWorkingThere'],
    );
  }
}
