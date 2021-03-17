import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillset/core/models/education.dart';
import 'package:skillset/core/models/user.dart';
import 'package:skillset/ui/shared/widgets/chips_input.dart';
import 'package:skillset/ui/shared/widgets/education_widget.dart';
import 'package:skillset/ui/shared/widgets/freelancer_widget.dart';

class JobsForMe extends StatefulWidget {
  @override
  _JobsForMeState createState() => _JobsForMeState();
}

class _JobsForMeState extends State<JobsForMe> {
  List<String> childChips = [];

  void getChips(passedChips) {
    print(passedChips);
    setState(() {
      childChips = passedChips;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.0),
        child: Consumer<User>(builder: (context, user, child) {
          return Column(
            children: [
              ChipsInputField(
                labelText: 'Something',
                getChips: getChips,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 22, 200, 0),
                child: EducationWidget(
                  education: Education(
                    certificate: "O'level",
                    school: 'St Johns Emerald Hill High School',
                    result: '16 As',
                    yearGraduated: 1999,
                  ),
                ),
              ),
              FreelancerWidget(user: user)
            ],
          );
        }),
      ),
    );
  }
}
