import 'package:flutter/material.dart';
import 'package:newserverdemo/core/models/posting.dart';
import 'package:newserverdemo/ui/shared/widgets/freelancer_widget.dart';
import 'package:newserverdemo/ui/shared/widgets/job_widget.dart';
import 'package:newserverdemo/ui/shared/widgets/short_profile_widget.dart';
import 'package:provider/provider.dart';
import 'package:newserverdemo/core/models/education.dart';
import 'package:newserverdemo/core/models/user.dart';
import 'package:newserverdemo/core/services/auth_service.dart';
import 'package:newserverdemo/ui/shared/widgets/chips_input.dart';
import 'package:newserverdemo/ui/shared/widgets/education_widget.dart';

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
    Freelancer freelancer = Provider.of<User>(context, listen: false);
    String atSign = Provider.of<AuthService>(context, listen: false).atsign;
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.0),
        child: ListView(
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
            ProfileShort(user: freelancer.user),
            SizedBox(height: 10),
            FreelanceBig(freelancer: freelancer),
            SizedBox(height: 10),
            JobWidget(posting: mockPosting),
            Text('$atSign'),
          ],
        ),
      ),
    );
  }
}
