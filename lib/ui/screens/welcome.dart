import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:newserverdemo/ui/screens/profile/details.dart';
import 'package:newserverdemo/ui/shared/widgets/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static final String id = "WelcomeScreen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(flex: 1, child: Container()),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  'WELCOME',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'BebasNeue',
                                    fontSize: 90,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  "Please select a role to continue",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      // ignore: missing_required_param
                      child: RoundedButton(
                        text: 'Looking for a Freelancer.',
                        path: _home,
                      ),
                    )),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        // ignore: missing_required_param
                        child: RoundedButton(
                          text: 'Looking for Work.',
                          path: _home,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }

  _home() async {
    FocusScope.of(context).unfocus();
    setState(() {
      showSpinner = true;
    });
    Navigator.pushReplacementNamed(context, PersonalDetails.id);
  }
}
