import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:newserverdemo/ui/screens/freelancer/profile/skills.dart';
import 'package:newserverdemo/ui/shared/widgets/rounded_button.dart';

class FreelancerDescription extends StatefulWidget {
  static final String id = "FreelancerDescription";
  @override
  _FreelancerDescriptionState createState() => _FreelancerDescriptionState();
}

class _FreelancerDescriptionState extends State<FreelancerDescription> {
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
                                'Description',
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
                                "Fill in your work details.",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ),
                          SizedBox(height: 60),
                          Container(
                              child: Column(children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(),
                                ),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Job Title',
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.work),
                                ),
                              ),
                            ),
                            SizedBox(),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(),
                                ),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'About You',
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.person),
                                ),
                              ),
                            ),
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
    Navigator.pushReplacementNamed(context, FreelancerSkills.id);
  }
}
