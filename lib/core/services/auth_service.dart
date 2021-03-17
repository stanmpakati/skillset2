import 'package:flutter/material.dart';
import 'package:skillset/core/services/server_demo_service.dart';
import 'package:at_demo_data/at_demo_data.dart' as at_demo_data;

class AuthService extends ChangeNotifier {
  String _atsign;
  ServerDemoService _serverDemoService = ServerDemoService.getInstance();

  String get atsign => _atsign;

  void login(String atSign) {
    String jsonData = _serverDemoService.encryptKeyPairs(atSign);
    if (atSign != null) {
      _serverDemoService.onboard(atsign: atSign).then((result) {
        if (result) {
          _atsign = atSign;
          notifyListeners();
        }
      }).catchError((error) async {
        await _serverDemoService.authenticate(atSign,
            jsonData: jsonData, decryptKey: at_demo_data.aesKeyMap[atSign]);
        _atsign = atSign;
        notifyListeners();
      });
    }
  }
}
