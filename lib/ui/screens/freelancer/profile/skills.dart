import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:newserverdemo/ui/screens/freelancer/freelancer_view.dart';
import 'package:newserverdemo/ui/shared/widgets/chips_input.dart';
import 'package:newserverdemo/ui/shared/widgets/rounded_button.dart';

class FreelancerSkills extends StatefulWidget {
  static final String id = "FreelancerSkills";
  @override
  _FreelancerSkillsState createState() => _FreelancerSkillsState();
}

class _FreelancerSkillsState extends State<FreelancerSkills> {
  List<String> childChips = [];
  void getChips(passedChips) {
    print(passedChips);
    setState(() {
      childChips = passedChips;
    });
  }

  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
              child: Center(
            child: Column(
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
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline6,
                              ),
                            ),
                          ),
                          SizedBox(height: 60),
                          Container(
                              child: Column(children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              child: ChipsInputField(
                                labelText: 'Skills',
                                getChips: getChips,
                              ),
                            ),
                            SizedBox(),
                          ])),
                        ],
                      ))),
                ),
                // ignore: missing_required_param
                RoundedButton(
                  text: 'Next',
                  path: _next,
                ),
              ],
            ),
          ))),
    );
  }

  _next() async {
    FocusScope.of(context).unfocus();
    setState(() {
      showSpinner = true;
    });
    Navigator.pushReplacementNamed(context, FreelancerView.id);
  }
}
