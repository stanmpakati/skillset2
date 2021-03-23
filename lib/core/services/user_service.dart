import 'package:flutter/material.dart';
import 'package:at_commons/at_commons.dart';
import 'package:newserverdemo/core/models/user.dart';
import 'package:newserverdemo/ui/screens/freelancer/freelancer_view.dart';
import 'package:newserverdemo/ui/screens/welcome.dart';

import 'server_demo_service.dart';

class UserService extends ChangeNotifier {
  Freelancer _freelancer;
  ServerDemoService _atClientService = ServerDemoService.getInstance();
  Map<String, dynamic> profileData = {
    'userId': null,
    'atSign': null,
    'profilePicture': null,
    'firstName': null,
    'lastName': null,
    'email': null,
    'city': null,
    'country': null,
    'bio': null,
  };
  List<String> skills = [];

  Freelancer get freelancer => _freelancer;

  void getUser(BuildContext context, String atSign) async {
    AtKey lookup = AtKey();
    lookup.key = 'user';
    lookup.sharedWith = atSign;
    String response = await _atClientService.get(lookup);
    if (response == null) {
      print('Go to Welcome Screen');
      Navigator.pushReplacementNamed(context, WelcomeScreen.id);
    }
    print('Go to Main Screen');
    // Navigator.pushReplacementNamed(context, FreelancerView.id);
  }

  void makeUser() {}
}
