import 'package:flutter/material.dart';
import 'package:newserverdemo/core/services/auth_service.dart';
import 'package:newserverdemo/core/services/user_service.dart';
import 'package:newserverdemo/ui/screens/login/login.dart';
import 'package:newserverdemo/ui/screens/login/on_boad.dart';
import 'package:provider/provider.dart';

import 'ui/screens/freelancer_view.dart';

class AuthenticationWrapper extends StatelessWidget {
  static final String id = "AuthWrapper";
  const AuthenticationWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (BuildContext contex, AuthService authService, Widget child) {
        if (authService.atsign == null) {
          return LoginAtSign();
        }

        return Consumer<UserService>(
          builder:
              (BuildContext contex, UserService userService, Widget child) {
            if (userService.freelancer == null) {
              userService.getUser();
              return OnBoard();
            }
            return FreelancerView();
          },
        );
      },
    );
  }
}
