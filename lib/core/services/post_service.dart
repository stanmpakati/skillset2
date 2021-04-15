import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:at_commons/at_commons.dart';
import 'package:newserverdemo/core/models/posting.dart';

import 'server_demo_service.dart';

class PostService extends ChangeNotifier {
  ServerDemoService _atClientService = ServerDemoService.getInstance();
  List<Posting> _myPosts = [];

  List<Posting> get myPosts => _myPosts;

  Future<String> _getAtSign() async {
    return await _atClientService.getAtSign();
  }

  Future<void> sendPost(String atSign, Posting jobPosting) async {
    String valueJson = jsonEncode(jobPosting.toMap());

    AtKey pair = AtKey();
    pair.key = jobPosting.title;
    pair.sharedWith = '@bob🛠';
    await _atClientService.put(pair, valueJson);
  }

  Future<void> getMyPosts() async {
    String atSign = await _getAtSign();
    List<AtKey> response = await _atClientService.getAtKeys();
    List<String> keys = [];

    if (response != null && response.length > 0) {
      keys = response
          .where((atkey) => atkey.key != 'user')
          .map((atKey) => atKey.key)
          .toList();

      List<Map<String, dynamic>> postJson = [];
      if (keys.length != 0) {
        for (String key in keys) {
          List<String> values = [];
          String value = await lookup(key, atSign);
          values.add(value);
          postJson.add(jsonDecode(value));
        }
      }

      List<Posting> postings = [];
      postings = postJson.map((map) => Posting.fromJson(map)).toList();
      _myPosts = postings;
      notifyListeners();
    }
  }

  Future<String> lookup(String key, String atSign) async {
    AtKey lookup = AtKey();
    lookup.key = key;
    lookup.sharedWith = '@bob🛠';
    String response = await _atClientService.get(lookup);
    return response;
  }
}
