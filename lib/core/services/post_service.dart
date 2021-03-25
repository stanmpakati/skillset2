import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:at_commons/at_commons.dart';
import 'package:newserverdemo/core/models/posting.dart';

import 'server_demo_service.dart';

class PostService extends ChangeNotifier {
  ServerDemoService _atClientService = ServerDemoService.getInstance();
  List<Posting> _myPosts;

  List<Posting> get myPosts => _myPosts;

  Future<void> sendPost(String atSign, Posting jobPosting) async {
    // Map<String, dynamic> valueObj = jobPosting.toMap();
    // String valueJson = valueObj.toString();
    String valueJson = jsonEncode(jobPosting.toMap());

    AtKey pair = AtKey();
    pair.key = jobPosting.title;
    pair.sharedWith = 'bob🛠';
    await _atClientService.put(pair, valueJson);
  }

  Future<void> getMyPosts(String atSign) async {
    List<AtKey> response = await _atClientService.getAtKeys(sharedBy: atSign);
    if (response.length > 0) {
      List<String> scanList = response.map((atKey) => atKey.key).toList();
    }
  }

  _lookup(String lookupKey, String atSign) async {
    if (lookupKey != null) {
      AtKey lookup = AtKey();
      lookup.key = lookupKey;
      lookup.sharedWith = atSign;
      String response = await _atClientService.get(lookup);
      if (response != null) {}
    }
  }
}
