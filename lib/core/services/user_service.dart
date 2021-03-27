import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:at_commons/at_commons.dart';
import 'package:newserverdemo/core/models/user.dart';
import 'package:newserverdemo/ui/screens/freelancer/freelancer_view.dart';
import 'package:newserverdemo/ui/screens/freelancer/signup/on_boad.dart';
import 'package:newserverdemo/ui/screens/welcome.dart';

import 'server_demo_service.dart';

class UserService extends ChangeNotifier {
  Freelancer _freelancer;
  ServerDemoService _atClientService = ServerDemoService.getInstance();
  Map<String, dynamic> profileData = {
    "userId": String,
    "atSign": String,
    "profilePicture": String,
    "firstName": String,
    "lastName": String,
    "email": String,
    "city": String,
    "country": String,
    "bio": String,
    "stars": int,
    "title": String,
    "skills": [],
    "education": [],
    "workHistory": [],
    "priceList": [],
  };

  Freelancer get freelancer => _freelancer;

  void uploadUser(BuildContext context, Map<String, dynamic> userMap) async {
    String atSign = await _atClientService.getAtSign();
    userMap['atSign'] = atSign;
    String valueJson = jsonEncode(userMap);

    AtKey pair = AtKey();
    pair.key = 'user';
    pair.sharedWith = userMap['atSign'];
    await _atClientService.put(pair, valueJson);

    getUser(context, userMap['atSign']);
  }

  void getUser(BuildContext context, String atSign) async {
    AtKey lookup = AtKey();
    lookup.key = 'user';
    lookup.sharedWith = atSign;
    String response = await _atClientService.get(lookup);
    if (response != null) {
      print('$response');
      Map<String, dynamic> json = jsonDecode(response);
      _freelancer = Freelancer.fromJson(json);
      notifyListeners();
      Navigator.pushReplacementNamed(context, FreelancerView.id);
    }
    print('Go to Main Screen');
    Navigator.pushReplacementNamed(context, OnBoard.id);
  }
}
