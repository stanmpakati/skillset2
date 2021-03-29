import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:at_commons/at_commons.dart';
import 'package:newserverdemo/core/models/posting.dart';

import 'server_demo_service.dart';

class PostService extends ChangeNotifier {
  ServerDemoService _atClientService = ServerDemoService.getInstance();
  List<Posting> _myPosts;

  List<Posting> get myPosts => _myPosts;

  Future<String> _getAtSign() async {
    return await _atClientService.getAtSign();
  }

  Future<void> sendPost(String atSign, Posting jobPosting) async {
    String valueJson = jsonEncode(jobPosting.toMap());

    AtKey pair = AtKey();
    pair.key = jobPosting.title;
    pair.sharedWith = atSign;
    await _atClientService.put(pair, valueJson);
  }

  Future<void> getMyPosts() async {
    String atSign = await _getAtSign();
    List<AtKey> response = await _atClientService.getAtKeys(sharedBy: atSign);
    List<String> scanList = [];

    if (response.length > 0) {
      scanList = response.map((atKey) => atKey.key).toList();

      List<String> values = [];
      List<Map<String, dynamic>> postJson = [];
      for (String key in scanList) {
        String value = await _lookup(key, atSign);
        values.add(value);
        postJson.add(jsonDecode(value));
      }

      List<Posting> postings = [];
      postings = postJson.map((map) => Posting.fromJson(map)).toList();
      print(postings);
      _myPosts = postings;
      notifyListeners();
    }
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
