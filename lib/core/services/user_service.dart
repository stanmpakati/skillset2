import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:at_commons/at_commons.dart';
import 'package:newserverdemo/core/models/user.dart';

import 'server_demo_service.dart';

class UserService extends ChangeNotifier {
  Freelancer _freelancer;
  ServerDemoService _atClientService = ServerDemoService.getInstance();

  Freelancer get freelancer => _freelancer;

  Future<void> uploadUser(
      BuildContext context, Map<String, dynamic> userMap) async {
    String atSign = await _atClientService.getAtSign();
    userMap['atSign'] = atSign;
    String valueJson = jsonEncode(userMap);

    AtKey pair = AtKey();
    pair.key = 'user';
    pair.sharedWith = userMap['atSign'];
    await _atClientService.put(pair, valueJson);

    getUser();
  }

  Future<void> getUser() async {
    String atSign = await _atClientService.getAtSign();

    AtKey lookup = AtKey();
    lookup.key = 'user';
    lookup.sharedWith = atSign;
    String response = await _atClientService.get(lookup);

    if (response != null) {
      print('at response: $response');
      Map<String, dynamic> json = jsonDecode(response);
      _freelancer = Freelancer.fromJson(json);
      print('name: ${_freelancer.firstName}');
      notifyListeners();
    }
    print('No User data');
  }
}
