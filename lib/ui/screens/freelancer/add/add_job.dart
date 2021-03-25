import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:newserverdemo/core/models/posting.dart';
import 'package:newserverdemo/core/models/pricing.dart';
import 'package:newserverdemo/core/services/auth_service.dart';
import 'package:newserverdemo/core/services/post_service.dart';
import 'package:newserverdemo/ui/shared/widgets/chips_input.dart';
import 'package:newserverdemo/ui/shared/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

class AddJob extends StatefulWidget {
  @override
  _AddJobState createState() => _AddJobState();
}

class _AddJobState extends State<AddJob> {
  TextEditingController _jobTitleContoller = TextEditingController();
  TextEditingController _jobDescriptionContoller = TextEditingController();
  TextEditingController _locationContoller = TextEditingController();
  TextEditingController _priceContoller = TextEditingController();
  TextEditingController _unitContoller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Price _price;
  List<String> tags = [];
  bool showSpinner = false;
  Posting _posting;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _jobTitleContoller.dispose();
    _jobDescriptionContoller.dispose();
    _locationContoller.dispose();
    _priceContoller.dispose();
    _unitContoller.dispose();
    super.dispose();
  }

  final snackBar = SnackBar(content: Text('Posted!'));

  void getChips(passedChips) {
    print(passedChips);
    setState(() {
      tags = passedChips;
    });
  }

  void _submit(atSign) async {
    if (_formKey.currentState.validate()) {
      setState(() {
        // set loading state
        showSpinner = true;
      });
      print(tags);
      print(_jobDescriptionContoller.text);
      // set Price
      _price = Price(
        amount: int.parse(_priceContoller.text),
        unit: _unitContoller.text,
      );
      // set Posting
      _posting = Posting(
        postedBy: atSign,
        postedOn: DateTime.now(),
        title: _jobTitleContoller.text,
        description: _jobDescriptionContoller.text,
        skills: tags,
        location: _locationContoller.text,
        pay: _price,
      );
      await PostService().sendPost(atSign, _posting);
      _formKey.currentState.reset();
      _jobTitleContoller.clear();
      _jobDescriptionContoller.clear();
      _locationContoller.clear();
      _priceContoller.clear();
      _unitContoller.clear();
      print('done');
      setState(() {
        showSpinner = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    String atSign = Provider.of<AuthService>(context).atsign;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Job listing'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
            children: [
              Text(
                  'We are so glad you want to create a job, just fill in the details below'),
              SizedBox(height: 14),
              TextFormField(
                  controller: _jobTitleContoller,
                  decoration: InputDecoration(
                    hintText: 'Job Title',
                    labelText: 'Job Title',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Required!';
                    }
                    if (value.length > 50) {
                      return 'Title too long';
                    }
                    return null;
                  }),
              SizedBox(height: 14),
              TextFormField(
                  controller: _locationContoller,
                  decoration: InputDecoration(
                      hintText: 'Job Location', labelText: 'Job Location'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Required!';
                    }
                    return null;
                  }),
              SizedBox(height: 14),
              ChipsInputField(labelText: 'Skills Required', getChips: getChips),
              SizedBox(height: 18),
              Text(
                'Pricing',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextFormField(
                controller: _priceContoller,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(labelText: 'Amount'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Required!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 14),
              TextFormField(
                controller: _unitContoller,
                decoration: InputDecoration(labelText: 'Pay Unit'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Required!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 18),
              Text(
                'Job Description',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextFormField(
                  controller: _jobDescriptionContoller,
                  maxLines: 10,
                  minLines: 3,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    hintText: 'Job Description',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Required!';
                    }
                    return null;
                  }),
              SizedBox(height: 14),
              RoundedButton(path: () => _submit(atSign), text: 'Submit')
            ],
          ),
        ),
      ),
    );
  }
}
