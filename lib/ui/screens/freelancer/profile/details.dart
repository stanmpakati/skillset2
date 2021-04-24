import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newserverdemo/ui/screens/freelancer/signup/on_boad.dart';

class PersonalDetails extends StatefulWidget {
  static final String id = "PersonalDetails";
  final Function function;

  const PersonalDetails({Key key, this.function}) : super(key: key);
  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  File _image;
  Map<String, dynamic> userMap = {};

  @override
  Widget build(BuildContext context) {
    return Form(
      key: pdFormKey,
      child: ListView(
        children: <Widget>[
          Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Personal Details',
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
                "Build your profile.",
                textAlign: TextAlign.center,
                style: Theme.of(context).primaryTextTheme.headline6,
              ),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                _showPicker(context);
              },
              child: CircleAvatar(
                radius: 55,
                child: _image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.file(
                          _image,
                          width: 130,
                          height: 130,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        width: 100,
                        height: 100,
                        child: Icon(
                          Icons.person_add,
                          size: 60,
                          color: Colors.grey[800],
                        ),
                      ),
              ),
            ),
          ),
          SizedBox(height: 30),
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
                    onSaved: (newValue) {
                      userMap['firstName'] = newValue;
                    },
                    decoration: InputDecoration(
                      hintText: 'First Name',
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
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(),
                    ),
                  ),
                  child: TextFormField(
                    onSaved: (newValue) {
                      userMap['lastName'] = newValue;
                    },
                    decoration: InputDecoration(
                      hintText: 'Last Name',
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
                SizedBox(),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(),
                    ),
                  ),
                  child: TextFormField(
                    onSaved: (newValue) {
                      userMap['email'] = newValue;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email Address',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.mail),
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
                    onSaved: (newValue) {
                      userMap['city'] = newValue;
                    },
                    decoration: InputDecoration(
                      hintText: 'City',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.home),
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
                    onSaved: (newValue) {
                      userMap['country'] = newValue;
                      widget.function(userMap);
                    },
                    decoration: InputDecoration(
                      hintText: 'Country',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.location_on_rounded),
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
    );
  }

  // Get from Camera
  _getFromCamera() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Get from gallery
  _getFromGallery() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('Photo Library'),
                  onTap: () {
                    _getFromGallery();
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Camera'),
                  onTap: () {
                    _getFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
