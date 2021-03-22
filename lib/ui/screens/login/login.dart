import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:newserverdemo/core/services/auth_service.dart';
import 'package:newserverdemo/core/services/server_demo_service.dart';
import 'package:newserverdemo/ui/screens/welcome.dart';
import 'package:newserverdemo/ui/shared/widgets/rounded_button.dart';
import 'package:at_demo_data/at_demo_data.dart' as at_demo_data;

class LoginAtSign extends StatefulWidget {
  static final String id = "LoginAtSign";
  @override
  _LoginAtSignState createState() => _LoginAtSignState();
}

class _LoginAtSignState extends State<LoginAtSign> {
  bool showSpinner = false;
  String _atSign;
  ServerDemoService _serverDemoService = ServerDemoService.getInstance();

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
                                'SkillSet',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'BebasNeue',
                                  fontSize: 85,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                "Zim's #1 Freelance App.",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        title: Center(
                          // ignore: missing_required_param
                          child: DropdownButton<String>(
                            hint: Text(
                              '\tPick an @sign',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            icon: Icon(Icons.keyboard_arrow_down),
                            iconSize: 24,
                            //dropdownColor: Colors.black87,
                            elevation: 16,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black87,
                            ),
                            onChanged: (String newValue) {
                              print(newValue);
                              setState(() {
                                _atSign = newValue;
                              });
                            },
                            value: _atSign != null ? _atSign : null,
                            items: at_demo_data.allAtsigns
                                .map<DropdownMenuItem<String>>(
                              (String value) {
                                return DropdownMenuItem<String>(
                                    value: value, child: Text(value));
                              },
                            ).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    // ignore: missing_required_param
                    child: RoundedButton(
                      text: 'Login',
                      path: _next,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _next() async {
    FocusScope.of(context).unfocus();
    setState(() {
      showSpinner = true;
    });
    Provider.of<AuthService>(context, listen: false).login(context, _atSign);
  }
}
