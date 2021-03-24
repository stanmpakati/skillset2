import 'package:flutter/material.dart';
import 'package:at_commons/at_commons.dart';

import 'package:newserverdemo/core/models/job.dart';
import 'package:newserverdemo/core/services/server_demo_service.dart';
import '../../ui/shared/utils/constants.dart' as constant;

class JobsService extends ChangeNotifier {
  List<Job> _jobs = [];
  // List<String
  ServerDemoService _atClientService = ServerDemoService.getInstance();

  List<Job> get jobs => _jobs;

  void loadJobs(atSign) async {
    List<AtKey> response = await _atClientService.getAtKeys(sharedBy: atSign);
    List<String> scanList = [];
    if (response.length > 0) {
      scanList = response.map((atKey) => atKey.key).toList();
    }
    List<String> responseList = [];
    for (String key in scanList) {
      String value = await _lookup(key, atSign);
      // Appending the title of the dish to the rest of its attributes
      value = key + constant.splitter + value;
      responseList.add(value);
    }
    print(responseList);
  }

  Future<String> _lookup(String key, String atSign) async {
    if (key != null) {
      AtKey lookup = AtKey();
      lookup.key = key;
      lookup.sharedWith = atSign;
      String response = await _atClientService.get(lookup);
      return response;
    }
    return '';
  }
}
