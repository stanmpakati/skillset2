import 'package:flutter/material.dart';
import 'package:newserverdemo/ui/shared/widgets/rounded_button.dart';

class WorkDetails extends StatefulWidget {
  final Function function;

  const WorkDetails({Key key, @required this.function}) : super(key: key);
  @override
  _WorkDetailsState createState() => _WorkDetailsState();
}

class _WorkDetailsState extends State<WorkDetails> {
  final workHistoryFormKey = GlobalKey<FormState>();
  TextEditingController _companyController = TextEditingController();
  TextEditingController _positionController = TextEditingController();
  TextEditingController _dateStartedController = TextEditingController();
  TextEditingController _dateFinishedController = TextEditingController();
  List<Map<String, dynamic>> workHist = [];

  void _addEducation() {
    if (workHistoryFormKey.currentState.validate()) {
      Map<String, dynamic> _education = {
        "position": _positionController.text,
        "companyName": _companyController.text,
        "startingYear": int.parse(_dateStartedController.text),
        "finishingYear": int.parse(_dateFinishedController.text),
      };
      workHist.add(_education);
      setState(() {
        workHist = workHist;
      });
      widget.function({'workHistory': workHist});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: workHistoryFormKey,
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Work History',
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
                        "Please Add any relevant work experience",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).primaryTextTheme.headline6,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  workHist.length == 0 ? nodata() : priceWidget(),
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
                              // user['title'] = value;
                            },
                            controller: _companyController,
                            decoration: InputDecoration(
                              labelText: 'Company',
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.apartment),
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
                            onSaved: (value) {},
                            controller: _positionController,
                            decoration: InputDecoration(
                              labelText: 'Position',
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.location_history_rounded),
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
                            onSaved: (value) {},
                            controller: _dateStartedController,
                            decoration: InputDecoration(
                              labelText: 'Year Started',
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.access_time),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please fill in';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(),
                            ),
                          ),
                          child: TextFormField(
                            onSaved: (value) {},
                            keyboardType: TextInputType.datetime,
                            controller: _dateFinishedController,
                            decoration: InputDecoration(
                              labelText: 'Year graduated',
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.access_time),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please fill in';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: RoundedButton(
                            path: _addEducation,
                            text: 'Add',
                            width: 60,
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

  Widget nodata() {
    return Column(
      children: [
        Icon(Icons.add, size: 75),
        Text(
          'No Education selected.\nPlease add relavant qualifications',
          textAlign: TextAlign.center,
          style: Theme.of(context).primaryTextTheme.caption,
        )
      ],
    );
  }

  Widget priceWidget() {
    // function builds the a role of chips above the input field
    List<Widget> priceWidgets = [];
    for (int i = 0; i < workHist.length; i++) {
      Container price = Container(
        padding: EdgeInsets.fromLTRB(14, 18, 14, 18),
        margin: EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Text(
          '${workHist[i]['companyName']}',
          style: TextStyle(fontSize: 16),
        ),
      );
      priceWidgets.add(price);
    }
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: priceWidgets,
    );
  }
}
