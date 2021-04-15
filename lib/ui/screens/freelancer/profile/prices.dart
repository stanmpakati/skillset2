import 'package:flutter/material.dart';
import 'package:newserverdemo/ui/shared/widgets/rounded_button.dart';

class PriceSheet extends StatefulWidget {
  final Function function;

  const PriceSheet({Key key, this.function}) : super(key: key);
  @override
  _PriceSheetState createState() => _PriceSheetState();
}

class _PriceSheetState extends State<PriceSheet> {
  final priceFormKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  List<Map<String, dynamic>> priceSheets = [];
  // List<Widget> priceWidgets = [];

  void _addPrice() {
    if (priceFormKey.currentState.validate()) {
      Map<String, dynamic> _price = {
        'amount': int.parse(_priceController.text),
        'unit': _nameController.text,
        'description': _descriptionController.text,
      };
      priceSheets.add(_price);
      setState(() {
        priceSheets = priceSheets;
      });
      widget.function({'priceList': priceSheets});
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
              key: priceFormKey,
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Price Sheet',
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
                        "Please give us a price sheet for your services.",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).primaryTextTheme.headline6,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  priceSheets.length == 0 ? nodata() : priceWidget(),
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
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: 'Service Name',
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
                            onSaved: (value) {},
                            controller: _descriptionController,
                            decoration: InputDecoration(
                              labelText: 'Price Description',
                              hintText: 'Short description',
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.assignment_sharp),
                            ),
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
                            keyboardType: TextInputType.number,
                            controller: _priceController,
                            decoration: InputDecoration(
                              labelText: 'Approximate price',
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.attach_money_rounded),
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
                            path: _addPrice,
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
    for (int i = 0; i < priceSheets.length; i++) {
      Container price = Container(
        padding: EdgeInsets.fromLTRB(14, 18, 14, 18),
        margin: EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Text(
          '${priceSheets[i]['unit']}',
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
