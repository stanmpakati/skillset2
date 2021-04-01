import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:at_commons/at_commons.dart';
import 'package:newserverdemo/core/models/user.dart';

import 'server_demo_service.dart';

class UserService extends ChangeNotifier {
  Freelancer _freelancer;
  List<Freelancer> _freelancers;
  ServerDemoService _atClientService = ServerDemoService.getInstance();

  Freelancer get freelancer => _freelancer;
  List<Freelancer> get freelancers => _freelancers;

  Future<void> uploadUser(
      BuildContext context, Map<String, dynamic> userMap) async {
    String atSign = await _atClientService.getAtSign();
    userMap['atSign'] = atSign;
    String valueJson = jsonEncode(userMap);

    AtKey pair = AtKey();
    pair.key = 'user';
    // pair.sharedWith = 'userMap['atSign']';
    pair.sharedWith = '@bob🛠';
    await _atClientService.put(pair, valueJson);

    getUser();
  }

  Future<void> getUser() async {
    String atSign = await _atClientService.getAtSign();

    AtKey lookup = AtKey();
    lookup.key = 'user';
    // lookup.sharedBy = '@barbara🛠';
    lookup.sharedWith = '@bob🛠';
    String response = await _atClientService.get(lookup);

    if (response != null) {
      Map<String, dynamic> json = jsonDecode(response);
      _freelancer = Freelancer.fromJson(json);

      print(_freelancer.firstName);
      notifyListeners();
    }
  }

  Future<void> getFreelancers() async {
    String atSign = await _atClientService.getAtSign();
    List<AtKey> response = await _atClientService.getAtKeys();

    // response = [...response, ...response2];
    List<String> keys = [];

    if (response != null && response.length > 0) {
      keys = response
          .where((atkey) => atkey.key == 'user')
          .map((atKey) => atKey.key)
          .toList();

      List<Map<String, dynamic>> freelancerJson = [];
      for (String key in keys) {
        List<String> values = [];
        String value = await lookup(key, atSign);
        values.add(value);

        freelancerJson.add(jsonDecode(value));
      }

      List<Freelancer> freelancers = [];
      freelancers =
          freelancerJson.map((map) => Freelancer.fromJson(map)).toList();
      _freelancers = freelancers;

      notifyListeners();
    }
  }

  Future<dynamic> lookup(String key, String atSign,
      {bool getUser = false}) async {
    if (key != null) {
      AtKey lookup = AtKey();
      lookup.key = key;
      lookup.sharedWith = '@bob🛠';
      String response = await _atClientService.get(lookup);

      if (getUser) {
        Map<String, dynamic> userJson = jsonDecode(response);
        return Freelancer.fromJson(userJson);
      }
      return response;
    }
    return '';
  }

  // Freelancer returnUser(String atSign){
  // TODO: fetch single user
  // }
}
