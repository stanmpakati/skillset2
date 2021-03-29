import 'package:flutter/material.dart';
import 'package:at_demo_data/at_demo_data.dart' as at_demo_data;

import 'user_service.dart';
import 'server_demo_service.dart';

class AuthService extends ChangeNotifier {
  String _atsign;
  ServerDemoService _atClientService = ServerDemoService.getInstance();
  UserService _userService;

  String get atsign => _atsign;

  void login(BuildContext context, String atSign) {
    String jsonData = _atClientService.encryptKeyPairs(atSign);
    if (atSign != null) {
      _atClientService.onboard(atsign: atSign).then((result) {
        print(_atsign);
        if (result) {
          _atsign = atSign;
          print(_atsign);
          notifyListeners();
          _userService.getUser();
        }
      }).catchError((error) async {
        await _atClientService.authenticate(atSign,
            jsonData: jsonData, decryptKey: at_demo_data.aesKeyMap[atSign]);
        _atsign = atSign;
        print(_atsign);
        notifyListeners();
        _userService.getUser();
      });
    }
  }
}
