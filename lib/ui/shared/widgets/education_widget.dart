import 'package:flutter/material.dart';
import 'package:newserverdemo/core/models/education.dart';

// Not finished yet, need to handle those not graduated yet
class EducationWidget extends StatelessWidget {
  final Education education;

  const EducationWidget({Key key, this.education}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            education.certificate != null ? education.certificate : '',
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            education.result != null ? education.result : '',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(
            education.school != null ? education.school : '',
          ),
          Text(
            education.yearGraduated != null
                ? education.yearGraduated.toString()
                : '',
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
