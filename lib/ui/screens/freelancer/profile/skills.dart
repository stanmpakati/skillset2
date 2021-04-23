import 'package:flutter/material.dart';
import 'package:newserverdemo/ui/shared/widgets/chips_input.dart';

class FreelancerSkills extends StatefulWidget {
  static final String id = "FreelancerSkills";
  final Function function;

  const FreelancerSkills({Key key, this.function}) : super(key: key);
  @override
  _FreelancerSkillsState createState() => _FreelancerSkillsState();
}

class _FreelancerSkillsState extends State<FreelancerSkills> {
  List<String> childChips = [];
  Map<String, dynamic> user = {};

  void getChips(passedChips) {
    setState(() {
      childChips = passedChips;
    });

    user['skills'] = childChips;
    widget.function(user);
  }

  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Skills',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'BebasNeue',
                          fontSize: 50,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Please fill your skills in the input below.",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).primaryTextTheme.headline6,
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          child: ChipsInputField(
                            labelText: 'Skills',
                            getChips: getChips,
                          ),
                        ),
                        SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
