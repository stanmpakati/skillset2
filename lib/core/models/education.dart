import 'package:flutter/foundation.dart';

class Education {
  final String certificate;
  final String result;
  final String school;
  final int yearGraduated;
  final bool graduated;

  Education({
    @required this.certificate,
    @required this.result,
    @required this.school,
    @required this.yearGraduated,
    this.graduated,
  });

  Map<String, dynamic> toMap() {
    return {
      'certificate': certificate,
      'result': result,
      'school': school,
      'yearGraduated': yearGraduated,
      'graduated': graduated,
    };
  }

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      certificate: json['certificate'],
      school: json['school'],
      yearGraduated: json['yearGraduated'],
      result: json['result'],
    );
  }
}
