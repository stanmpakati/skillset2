import 'package:flutter/material.dart';
import 'package:newserverdemo/core/services/server_demo_service.dart';
import 'package:at_demo_data/at_demo_data.dart' as at_demo_data;

class AuthService extends ChangeNotifier {
  String _atsign;
  ServerDemoService _serverDemoService = ServerDemoService.getInstance();

  String get atsign => _atsign;

  void login(BuildContext context, String atSign) {
    String jsonData = _serverDemoService.encryptKeyPairs(atSign);
    if (atSign != null) {
      _serverDemoService.onboard(atsign: atSign).then((result) {
        print(_atsign);
        if (result) {
          _atsign = atSign;
          print(_atsign);
          notifyListeners();
          // Navigator.pushReplacementNamed(context, WelcomeScreen.id);
        }
      }).catchError((error) async {
        await _serverDemoService.authenticate(atSign,
            jsonData: jsonData, decryptKey: at_demo_data.aesKeyMap[atSign]);
        _atsign = atSign;
        print(_atsign);
        notifyListeners();
        // Navigator.pushReplacementNamed(context, WelcomeScreen.id);
      });
    }
  }
}
