import 'package:flutter/material.dart';
import 'package:newserverdemo/ui/shared/widgets/rounded_button.dart';

class EducationDetails extends StatefulWidget {
  final Function function;

  const EducationDetails({Key key, this.function}) : super(key: key);
  @override
  _EducationDetailsState createState() => _EducationDetailsState();
}

class _EducationDetailsState extends State<EducationDetails> {
  final educationFormKey = GlobalKey<FormState>();
  TextEditingController _certificateController = TextEditingController();
  TextEditingController _resultController = TextEditingController();
  TextEditingController _schoolController = TextEditingController();
  TextEditingController _yearController = TextEditingController();
  List<Map<String, dynamic>> educationHist = [];

  void _addEducation() {
    if (educationFormKey.currentState.validate()) {
      Map<String, dynamic> _education = {
        'certificate': _certificateController.text,
        'result': _resultController.text,
        'school': _schoolController.text,
        'yearGraduated': int.parse(_yearController.text),
      };
      educationHist.add(_education);
      setState(() {
        educationHist = educationHist;
      });
      widget.function({'education': educationHist});
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
              key: educationFormKey,
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Education',
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
                        "Please Add your ecademic qualifications",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).primaryTextTheme.headline6,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  educationHist.length == 0 ? nodata() : priceWidget(),
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
                            controller: _certificateController,
                            decoration: InputDecoration(
                              labelText: 'Certification',
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.school),
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
                            controller: _resultController,
                            decoration: InputDecoration(
                              labelText: 'Results',
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.assignment_sharp),
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
                            controller: _schoolController,
                            decoration: InputDecoration(
                              labelText: 'School',
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
                            controller: _yearController,
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
        ),
      ],
    );
  }

  Widget priceWidget() {
    // function builds the a role of chips above the input field
    List<Widget> priceWidgets = [];
    for (int i = 0; i < educationHist.length; i++) {
      Container price = Container(
        padding: EdgeInsets.fromLTRB(14, 18, 14, 18),
        margin: EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Text(
          '${educationHist[i]['certificate']}',
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
