import 'package:flutter/foundation.dart';

class Education {
  final String certificate;
  final String result;
  final String school;
  final int yearGraduated;
  final bool graduated;

  Education({
    @required this.certificate,
    this.result,
    @required this.school,
    @required this.yearGraduated,
    this.graduated,
  });
}
