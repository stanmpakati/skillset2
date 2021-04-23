import 'package:flutter/material.dart';
import 'package:newserverdemo/ui/screens/freelancer/signup/on_boad.dart';

class FreelancerDescription extends StatefulWidget {
  static final String id = "FreelancerDescription";
  final Function function;

  const FreelancerDescription({Key key, this.function}) : super(key: key);
  @override
  _FreelancerDescriptionState createState() => _FreelancerDescriptionState();
}

class _FreelancerDescriptionState extends State<FreelancerDescription> {
  Map<String, dynamic> user = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: descriptionFormKey,
              child: Column(
                children: <Widget>[
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
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(),
                            ),
                          ),
                          child: TextFormField(
                            onSaved: (value) {
                              user['title'] = value;
                            },
                            decoration: InputDecoration(
                              labelText: 'Job Title',
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.work),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please fill in';
                              }
                              return null;
                            },
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
                          child: TextFormField(
                            onSaved: (value) {
                              user['bio'] = value;
                              widget.function(user);
                            },
                            decoration: InputDecoration(
                              labelText: 'About You',
                              hintText: 'Tell us about your self',
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.person),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please fill in';
                              }
                              return null;
                            },
                          ),
                        ),
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
